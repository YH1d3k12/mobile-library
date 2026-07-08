import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Tipografia inspirada em inscrições clássicas: títulos serifados
/// e fortes, corpo de texto legível e sóbrio.
class AppTypography {
  AppTypography._();

  static const String _serifFamily = 'Georgia';

  static const TextStyle displayTitle = TextStyle(
    fontFamily: _serifFamily,
    fontSize: 28,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
    color: AppColors.marble,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontFamily: _serifFamily,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.3,
    color: AppColors.ink,
  );

  static const TextStyle cardTitle = TextStyle(
    fontFamily: _serifFamily,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.ink,
  );

  static const TextStyle cardSubtitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.inkSoft,
  );

  static const TextStyle body = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.ink,
    height: 1.4,
  );

  static const TextStyle bodyMuted = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    color: AppColors.inkSoft,
    height: 1.4,
  );

  static const TextStyle label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.4,
    color: AppColors.goldDark,
  );
}
