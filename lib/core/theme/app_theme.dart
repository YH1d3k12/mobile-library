import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typography.dart';

class AppTheme {
  AppTheme._();

// TEMA CLARO
  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.royalPurple,
      primary: AppColors.royalPurple,
      secondary: AppColors.gold,
      surface: AppColors.marble,
      error: AppColors.error,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.marble,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.royalPurple,
        foregroundColor: AppColors.marble,
        elevation: 2,
        centerTitle: true,
        titleTextStyle: AppTypography.displayTitle,
        iconTheme: IconThemeData(color: AppColors.gold),
      ),
      cardTheme: CardThemeData(
        color: Colors.white,
        elevation: 3,
        shadowColor: AppColors.royalPurple.withValues(alpha: 0.25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: const BorderSide(color: AppColors.gold, width: 1),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.goldDark, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.gold, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.royalPurple, width: 2),
        ),
        hintStyle: AppTypography.bodyMuted,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gold,
          foregroundColor: AppColors.royalPurpleDark,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.royalPurple),
      textTheme: const TextTheme(
        headlineSmall: AppTypography.sectionTitle,
        titleMedium: AppTypography.cardTitle,
        bodyMedium: AppTypography.body,
        bodySmall: AppTypography.bodyMuted,
        labelLarge: AppTypography.label,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.royalPurpleDark,
        contentTextStyle: const TextStyle(color: AppColors.marble),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.goldDark,
        thickness: 0.6,
      ),
    );
  }

// TEMA ESCURO (DARK)
  static ThemeData get dark {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.royalPurple,
      primary: AppColors.royalPurple,
      secondary: AppColors.gold,
      surface: const Color(0xFF121212), // Fundo escuro
      error: AppColors.error,
      brightness: Brightness.dark,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xFF121212),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF1E1E1E), // App bar escura
        foregroundColor: AppColors.gold, // Mantém os textos e ícones dourados
        elevation: 2,
        centerTitle: true,
        titleTextStyle: AppTypography.displayTitle,
        iconTheme: IconThemeData(color: AppColors.gold),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF1E1E1E), // Cards escuros
        elevation: 3,
        shadowColor: Colors.black45,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: AppColors.goldDark.withValues(alpha: 0.5), width: 1),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF2C2C2C),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.goldDark.withValues(alpha: 0.5), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.gold.withValues(alpha: 0.5), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.gold, width: 2),
        ),
        hintStyle: AppTypography.bodyMuted,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.gold,
          foregroundColor: AppColors.royalPurpleDark,
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 3,
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.gold),
      textTheme: const TextTheme(
        headlineSmall: AppTypography.sectionTitle,
        titleMedium: AppTypography.cardTitle,
        bodyMedium: AppTypography.body,
        bodySmall: AppTypography.bodyMuted,
        labelLarge: AppTypography.label,
      ).apply(
        bodyColor: Colors.white70,
        displayColor: Colors.white,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.gold,
        contentTextStyle: const TextStyle(color: AppColors.royalPurpleDark, fontWeight: FontWeight.bold),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.goldDark.withValues(alpha: 0.3),
        thickness: 0.6,
      ),
    );
  }
}