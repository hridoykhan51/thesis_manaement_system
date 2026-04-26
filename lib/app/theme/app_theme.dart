import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF0F766E),
      brightness: Brightness.light,
    );

    final baseTheme = ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xFFF4F7F8),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
      ),
    );

    final bodyTextTheme = GoogleFonts.manropeTextTheme(baseTheme.textTheme);

    return baseTheme.copyWith(
      textTheme: bodyTextTheme.copyWith(
        displayLarge: GoogleFonts.spaceGrotesk(
          textStyle: bodyTextTheme.displayLarge,
          fontWeight: FontWeight.w700,
          letterSpacing: -1.6,
        ),
        displayMedium: GoogleFonts.spaceGrotesk(
          textStyle: bodyTextTheme.displayMedium,
          fontWeight: FontWeight.w700,
          letterSpacing: -1.2,
        ),
        displaySmall: GoogleFonts.spaceGrotesk(
          textStyle: bodyTextTheme.displaySmall,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.8,
        ),
        headlineLarge: GoogleFonts.spaceGrotesk(
          textStyle: bodyTextTheme.headlineLarge,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.6,
        ),
        headlineMedium: GoogleFonts.spaceGrotesk(
          textStyle: bodyTextTheme.headlineMedium,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
        headlineSmall: GoogleFonts.spaceGrotesk(
          textStyle: bodyTextTheme.headlineSmall,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.4,
        ),
      ),
    );
  }
}
