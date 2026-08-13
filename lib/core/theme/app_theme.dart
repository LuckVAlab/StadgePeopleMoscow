import 'package:flutter/material.dart';

/// Centralized app theme definitions for consistent dark UI.
class AppTheme {
  AppTheme._();

  // ─── Colors ───
  static const Color background = Color(0xFF0A0A0A);
  static const Color surface = Color(0xFF1C1C1E);
  static const Color surfaceLight = Color(0xFF2C2C2E);
  static const Color border = Color(0xFF3A3A3C);
  static const Color primary = Colors.blue;
  static const Color error = Colors.red;
  static const Color success = Colors.green;
  static const Color warning = Colors.amber;
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;
  static const Color textMuted = Colors.white54;
  static const Color textDisabled = Colors.white38;

  // ─── Text Styles ───
  static const TextStyle headline = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: textPrimary,
  );

  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    color: textSecondary,
  );

  static const TextStyle caption = TextStyle(
    fontSize: 13,
    color: textMuted,
  );

  static const TextStyle small = TextStyle(
    fontSize: 12,
    color: textMuted,
  );

  // ─── ThemeData ───
  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.dark(
        surface: background,
        surfaceContainerHighest: surface,
        primary: primary,
        error: error,
      ),
      cardTheme: CardTheme(
        color: surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: background,
        selectedItemColor: textPrimary,
        unselectedItemColor: textDisabled,
        type: BottomNavigationBarType.fixed,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: textPrimary,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(color: textMuted),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: textMuted),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: primary),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: error),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: error),
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: textPrimary,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: textMuted),
          foregroundColor: textSecondary,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: surfaceLight,
        contentTextStyle: TextStyle(color: textPrimary),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
