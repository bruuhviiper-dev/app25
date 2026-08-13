import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../data/app_info.dart';
import '../data/greeting_generator.dart';
import '../services/app_state.dart';
import '../widgets/banner_ad.dart';
import '../widgets/share_helper.dart';

/// Lista "infinita" de mensagens geradas (sem IA, offline), com um banner a
/// cada 5 mensagens.
class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  static const _every = 5; // mensagens entre banners
  static const _block = _every + 1; // 5 mensagens + 1 banner

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final state = context.watch<AppState>();
    final msgCount = GreetingGenerator.total;
    final itemCount = msgCount + (msgCount ~/ _every);

    return Scaffold(
      appBar: AppBar(title: const Text('🌸  Frases Bonitas')),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        itemCount: itemCount,
        itemBuilder: (context, i) {
          // A cada bloco de 6 posições, a última (índice 5) é um banner.
          if (i % _block == _every) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 12),
              child: BannerPlaceholder(),
            );
          }
          final msgIndex = (i ~/ _block) * _every + (i % _block);
          final text = state.personalize(GreetingGenerator.byIndex(msgIndex));
          final share = '$text\n\n🌸 ${AppInfo.appName}\n${AppInfo.shareFooter}';
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 6, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text, style: GoogleFonts.lora(fontSize: 16, height: 1.5)),
                  Row(
                    children: [
                      Text('Mensagem #${msgIndex + 1}',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: scheme.primary)),
                      const Spacer(),
                      IconButton(
                        tooltip: 'Editar',
                        icon: const Icon(Icons.edit_rounded, size: 20),
                        onPressed: () => _edit(context, text),
                      ),
                      IconButton(
                        tooltip: 'Copiar',
                        icon: const Icon(Icons.copy_rounded, size: 20),
                        onPressed: () async {
                          await ShareHelper.copy(share);
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Copiado!')),
                            );
                          }
                        },
                      ),
                      IconButton(
                        tooltip: 'Compartilhar',
                        icon: const Icon(Icons.share_rounded, size: 20),
                        onPressed: () => ShareHelper.share(share),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// Editar a frase antes de copiar/compartilhar (autonomia do usuário).
  void _edit(BuildContext context, String initial) {
    final c = TextEditingController(text: initial);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (ctx) => Padding(
        padding: EdgeInsets.fromLTRB(
            16, 0, 16, MediaQuery.of(ctx).viewInsets.bottom + 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text('Editar frase',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
            ),
            TextField(
              controller: c,
              maxLines: 5,
              minLines: 3,
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () async {
                      await ShareHelper.copy(c.text.trim());
                      if (ctx.mounted) Navigator.pop(ctx);
                    },
                    icon: const Icon(Icons.copy_rounded),
                    label: const Text('Copiar'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () {
                      Navigator.pop(ctx);
                      ShareHelper.share(c.text.trim());
                    },
                    icon: const Icon(Icons.share_rounded),
                    label: const Text('Compartilhar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
