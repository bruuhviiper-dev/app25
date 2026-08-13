import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/app_info.dart';
import 'settings_screen.dart';

/// Aba "Mais": avaliar, compartilhar, lembrete/notificações e o perfil da
/// desenvolvedora no Play (todos os apps da Phantom Tecnologia).
class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mais')),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.star_rounded, color: Color(0xFFFBBF24)),
            title: const Text('Avaliar na Play Store'),
            subtitle: const Text('Sua nota ajuda muito 💛'),
            onTap: () => _open(AppInfo.playUrl),
          ),
          ListTile(
            leading: const Icon(Icons.notifications_active_rounded),
            title: const Text('Lembrete e notificações'),
            subtitle: const Text('Ative a frase do dia no horário que quiser'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.ios_share_rounded),
            title: const Text('Compartilhar o app'),
            subtitle: const Text('Indique para os amigos'),
            onTap: () =>
                Share.share('Conheça o ${AppInfo.appName}! ${AppInfo.playUrl}'),
          ),
          const Divider(height: 8),
          ListTile(
            leading: const Icon(Icons.apps_rounded),
            title: const Text('Mais apps da Phantom Tecnologia'),
            subtitle: const Text('Veja todos os nossos apps na Play Store'),
            trailing: const Icon(Icons.open_in_new_rounded, size: 18),
            onTap: () => _open(AppInfo.devUrl),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text('By: ${AppInfo.developer}',
                style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
