import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../data/greeting_generator.dart';
import '../data/models.dart';
import '../services/app_state.dart';
import '../widgets/share_helper.dart';
import 'create_screen.dart';

/// Lista "infinita" de frases geradas (sem IA, offline). O banner fica no shell
/// (rodapé fixo), sem duplicar.
class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final state = context.watch<AppState>();
    final msgCount = GreetingGenerator.total;
    final itemCount = msgCount;

    return Scaffold(
      appBar: AppBar(title: const Text('Frases Bonitas')),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(16, 12, 16, 24 + MediaQuery.of(context).padding.bottom),
        itemCount: itemCount,
        itemBuilder: (context, i) {
          final msgIndex = i;
          final text = GreetingGenerator.byIndex(msgIndex);
          final share = '$text\n\n🌸 Frases Bonitas';
          final favId = Verse(text).id;
          final fav = state.isFavorite(favId);
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
                        tooltip: fav ? 'Desfavoritar' : 'Favoritar',
                        icon: Icon(
                            fav ? Icons.favorite : Icons.favorite_border,
                            size: 20,
                            color: fav ? const Color(0xFFE11D48) : null),
                        onPressed: () =>
                            context.read<AppState>().toggleFavorite(favId),
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
                        tooltip: 'Criar imagem',
                        icon: const Icon(Icons.image_rounded, size: 20),
                        onPressed: () => Navigator.of(context, rootNavigator: true)
                            .push(MaterialPageRoute(
                                builder: (_) => CreateScreen(initialText: text))),
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
}
