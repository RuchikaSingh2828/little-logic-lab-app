import 'package:flutter/material.dart';

class AppTheme {
  static const cream = Color(0xFFF7F1E8);
  static const woodBrown = Color(0xFF5C4033);
  static const softBrown = Color(0xFF7A5C4A);
  static const leafGreen = Color(0xFF6B8F71);
  static const softGreen = Color(0xFFA7C4A0);
  static const cardWhite = Color(0xFFFFFFFF);
  static const mutedLine = Color(0xFFE8DCC8);

  static const fox = Color(0xFF6B8F71);
  static const panda = Color(0xFF5B8FB9);
  static const bunny = Color(0xFF9B7EBD);
  static const leaf = Color(0xFF6B8F71);

  static const matching = Color(0xFFD8E8C8);
  static const sorting = Color(0xFFF3E6B8);
  static const patterns = Color(0xFFE4D4F0);
  static const sequencing = Color(0xFFD5EBD0);
  static const spatial = Color(0xFFF5D9C0);
  static const detective = Color(0xFFD0E4F5);

  static Color accentFor(String accentKey) {
    switch (accentKey) {
      case 'fox':
        return fox;
      case 'panda':
        return panda;
      case 'bunny':
        return bunny;
      default:
        return leaf;
    }
  }

  static String? avatarAssetFor(String accentKey) {
    switch (accentKey) {
      case 'fox':
        return 'assets/characters/fox.png';
      case 'panda':
        return 'assets/characters/panda.png';
      case 'bunny':
        return 'assets/characters/bunny.png';
      default:
        return null;
    }
  }

  static List<BoxShadow> get softShadow => [
        BoxShadow(
          color: woodBrown.withValues(alpha: 0.08),
          blurRadius: 18,
          offset: const Offset(0, 8),
        ),
      ];

  static ThemeData light() {
    final base = ColorScheme.fromSeed(
      seedColor: leafGreen,
      brightness: Brightness.light,
      surface: cream,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: base.copyWith(
        primary: leafGreen,
        onPrimary: Colors.white,
        secondary: softGreen,
        onSurface: woodBrown,
      ),
      scaffoldBackgroundColor: cream,
      textTheme: const TextTheme(
        headlineMedium: TextStyle(
          color: woodBrown,
          fontWeight: FontWeight.w800,
          fontSize: 28,
          height: 1.2,
        ),
        titleLarge: TextStyle(
          color: woodBrown,
          fontWeight: FontWeight.w800,
          fontSize: 22,
        ),
        titleMedium: TextStyle(
          color: woodBrown,
          fontWeight: FontWeight.w700,
          fontSize: 17,
        ),
        bodyLarge: TextStyle(color: softBrown, fontSize: 16, height: 1.35),
        bodyMedium: TextStyle(color: softBrown, fontSize: 14, height: 1.35),
        labelLarge: TextStyle(
          color: woodBrown,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: mutedLine),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: mutedLine),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: leafGreen, width: 2),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: leafGreen,
          foregroundColor: Colors.white,
          minimumSize: const Size(48, 52),
          shape: const StadiumBorder(),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
