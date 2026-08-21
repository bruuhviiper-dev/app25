import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/app_info.dart';
import 'settings_screen.dart';

/// Aba "Mais": lembrete diário, avaliar, compartilhar o app e cross-promoção.
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
            leading: const Icon(Icons.notifications_active_rounded,
                color: Color(0xFF7C3AED)),
            title: const Text('Lembrete diário'),
            subtitle: const Text('Receba uma frase de motivação no seu horário'),
            trailing: const Icon(Icons.chevron_right_rounded),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            ),
          ),
          const Divider(height: 8),
          ListTile(
            leading: const Icon(Icons.star_rounded, color: Color(0xFFFBBF24)),
            title: const Text('Avaliar na Play Store'),
            subtitle: const Text('Sua nota ajuda muito 💛'),
            onTap: () => _open(AppInfo.playUrl),
          ),
          ListTile(
            leading: const Icon(Icons.ios_share_rounded),
            title: const Text('Compartilhar o app'),
            subtitle: const Text('Indique para os amigos'),
            onTap: () =>
                Share.share('Conheça o ${AppInfo.appName}! ${AppInfo.playUrl}'),
          ),
          const Divider(height: 8),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 6),
            child: Text('Mais apps da Phantom 💜',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
          ),
          for (final app in AppInfo.otherApps)
            ListTile(
              leading: const Icon(Icons.apps_rounded, color: Color(0xFF7C3AED)),
              title: Text(app.$1),
              trailing: const Icon(Icons.open_in_new_rounded, size: 18),
              onTap: () => _open(AppInfo.playUrlFor(app.$2)),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
            child: OutlinedButton.icon(
              onPressed: () => _open(AppInfo.devUrl),
              icon: const Icon(Icons.storefront_rounded),
              label: const Text('Ver todos os apps'),
            ),
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
