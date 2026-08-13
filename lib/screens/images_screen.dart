import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../data/app_theme.dart';
import '../data/story_backgrounds.dart';
import '../data/verses.dart';
import 'create_screen.dart';

/// Galeria "Frases com Imagens": cards já montados (frase sobre um fundo
/// bonito). Tocar abre o Editor PRO já com a frase + fundo pra editar/compartilhar.
class ImagesScreen extends StatelessWidget {
  const ImagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final frases = VerseData.freeVerses;
    final bgs = StoryBg.all;
    return Scaffold(
      appBar: AppBar(title: const Text('🖼️  Frases com Imagens')),
      body: GridView.builder(
        padding: const EdgeInsets.all(14),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          childAspectRatio: 0.72,
        ),
        itemCount: frases.length,
        itemBuilder: (context, i) {
          final frase = frases[i];
          final bgIndex = i % bgs.length;
          final bg = bgs[bgIndex];
          return Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAlias,
            child: Ink(
              decoration: BoxDecoration(
                gradient: bg.isImage ? null : AppTheme.gradient(bg.colors),
                image: bg.isImage
                    ? DecorationImage(
                        image: AssetImage(bg.asset!), fit: BoxFit.cover)
                    : null,
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => CreateScreen(
                        initialText: frase.text, initialBg: bgIndex),
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          frase.text,
                          textAlign: TextAlign.center,
                          maxLines: 6,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.lora(
                            color: Colors.white,
                            fontSize: 15,
                            height: 1.4,
                            fontWeight: FontWeight.w600,
                            shadows: const [
                              Shadow(
                                  color: Colors.black38,
                                  blurRadius: 8,
                                  offset: Offset(0, 2)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 8,
                      right: 10,
                      child: Row(
                        children: [
                          Icon(Icons.edit_rounded,
                              color: Colors.white70, size: 14),
                          SizedBox(width: 4),
                          Text('editar',
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
