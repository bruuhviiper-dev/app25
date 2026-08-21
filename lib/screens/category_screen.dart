import 'package:flutter/material.dart';

import '../data/models.dart';
import '../widgets/verse_tile.dart';

/// Lista de frases de uma categoria. O banner fica no shell (rodapé fixo) e a
/// barra de navegação permanece visível (navegadores aninhados por aba).
class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.category});

  final VerseCategory category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${category.emoji}  ${category.name}')),
      body: SafeArea(
        top: false,
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 12, bottom: 24),
          itemCount: category.verses.length,
          itemBuilder: (context, i) => VerseTile(verse: category.verses[i]),
        ),
      ),
    );
  }
}
