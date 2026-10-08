import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF00E676);
  static const Color secondary = Color(0xFFFFAB00);
  static const Color background = Color(0xFF0C160E);
  static const Color surface = Color(0xFF122216);
  static const Color card = Color(0xFF1A2E1E);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;

  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: background,
        colorScheme: const ColorScheme.dark(
          primary: primary,
          secondary: secondary,
          surface: surface,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: surface,
          indicatorColor: primary.withValues(alpha: 0.25),
          labelTextStyle: WidgetStateProperty.all(
            const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: textSecondary),
          ),
        ),
      );
}
