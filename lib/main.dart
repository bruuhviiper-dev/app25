import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/app_theme.dart';
import 'screens/create_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/home_screen.dart';
import 'screens/images_screen.dart';
import 'screens/message_notification_screen.dart';
import 'screens/more_screen.dart';
import 'screens/splash_screen.dart';
import 'services/ads_service.dart';
import 'services/app_state.dart';
import 'services/notification_service.dart';
import 'services/purchase_service.dart';
import 'widgets/banner_ad.dart';

/// Navegador raiz — abre a frase ao tocar na notificação (mesmo app fechado).
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

void openMessageFromNotification(String? payload) {
  final p = payload?.trim();
  if (p == null || p.isEmpty) return;
  final nav = rootNavigatorKey.currentState;
  if (nav == null) return;
  nav.push(MaterialPageRoute(
      builder: (_) => MessageNotificationScreen(message: p)));
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  GoogleFonts.poppins();
  final prefs = await SharedPreferences.getInstance();
  final appState = AppState(prefs);

  AdsService.instance.init();

  PurchaseService.instance
    ..onEntitlement(appState.grantEntitlement)
    ..onSubscriptionGranted(appState.addSubscription)
    ..init();

  final notif = NotificationService.instance;
  notif.onSelectMessage = openMessageFromNotification;
  notif.init().then((_) {
    if (appState.reminderOn) {
      notif.scheduleDaily(appState.reminderHour, appState.reminderMin);
    }
    final pending = notif.takePendingLaunchPayload();
    if (pending != null) {
      Future.delayed(const Duration(milliseconds: 1200),
          () => openMessageFromNotification(pending));
    }
  });

  runApp(MensagensApp(appState: appState));
}

class MensagensApp extends StatelessWidget {
  const MensagensApp({super.key, required this.appState});

  final AppState appState;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: appState,
      child: Consumer<AppState>(
        builder: (context, state, _) => MaterialApp(
          navigatorKey: rootNavigatorKey,
          title: 'Frases Bonitas',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(state.accentColor),
          darkTheme: AppTheme.dark(state.accentColor),
          themeMode: state.themeMode,
          home: const _RootGate(),
        ),
      ),
    );
  }
}

/// Splash da marca por ~2s que ESMAECE por cima do app (sem "piscar"). A
/// HomeShell (pesada) é montada 1 frame depois, pro splash pintar rápido.
class _RootGate extends StatefulWidget {
  const _RootGate();

  @override
  State<_RootGate> createState() => _RootGateState();
}

class _RootGateState extends State<_RootGate> {
  bool _ready = false;
  bool _splashGone = false;
  bool _buildHome = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) setState(() => _buildHome = true);
    });
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (mounted) setState(() => _ready = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_buildHome) const HomeShell(),
        if (!_splashGone)
          AnimatedOpacity(
            opacity: _ready ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
            onEnd: () {
              if (_ready && mounted) setState(() => _splashGone = true);
            },
            child: const SplashScreen(),
          ),
      ],
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    const pages = [
      HomeScreen(),
      ImagesScreen(),
      CreateScreen(),
      FavoritesScreen(),
      MoreScreen()
    ];
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: IndexedStack(index: _index, children: pages)),
          const BannerPlaceholder(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (i) { setState(() => _index = i); if (!context.read<AppState>().adsRemoved) AdsService.instance.registerActionAndMaybeShow(); },
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home_rounded),
              label: 'Início'),
          NavigationDestination(
              icon: Icon(Icons.photo_library_outlined),
              selectedIcon: Icon(Icons.photo_library_rounded),
              label: 'Imagens'),
          NavigationDestination(
              icon: Icon(Icons.add_circle_outline_rounded),
              selectedIcon: Icon(Icons.add_circle_rounded),
              label: 'Criar'),
          NavigationDestination(
              icon: Icon(Icons.favorite_border_rounded),
              selectedIcon: Icon(Icons.favorite_rounded),
              label: 'Favoritos'),
          NavigationDestination(
              icon: Icon(Icons.more_horiz_rounded),
              selectedIcon: Icon(Icons.more_horiz_rounded),
              label: 'Mais'),
        ],
      ),
    );
  }
}
