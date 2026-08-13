import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Splash da marca (Frases Bonitas). Fundo dourado-celestial em
/// gradiente com a assinatura da Phantom Tecnologia. É
/// desenhada por cima do app e esmaece (sem "piscar"), ver _RootGate no main.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFFF758C), Color(0xFFFF7EB3)],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Colors.white.withValues(alpha: 0.28),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('🌸', style: TextStyle(fontSize: 96)),
                  const SizedBox(height: 22),
                  Text(
                    'Frases Bonitas',
                    style: GoogleFonts.poppins(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'inspiração pra cada dia ✨',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: const Color(0xFFFFF6DA),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 46),
                child: Text(
                  'por Phantom Tecnologia',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white.withValues(alpha: 0.82),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
