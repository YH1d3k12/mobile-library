import 'package:flutter/material.dart';

/// Paleta inspirada na estética macedônica antiga:
/// dourado imperial (Sol de Vergina), roxo real (púrpura de Tiro),
/// mármore e terracota do Mediterrâneo.
class AppColors {
  AppColors._();

  // Dourado imperial
  static const Color gold = Color(0xFFC9A24B);
  static const Color goldLight = Color(0xFFE4C97A);
  static const Color goldDark = Color(0xFF9C7B2E);

  // Púrpura real
  static const Color royalPurple = Color(0xFF4B1D3F);
  static const Color royalPurpleLight = Color(0xFF6E2C5E);
  static const Color royalPurpleDark = Color(0xFF2E1027);

  // Mármore
  static const Color marble = Color(0xFFF3EEE4);
  static const Color marbleDark = Color(0xFFE3DBC8);

  // Terracota
  static const Color terracotta = Color(0xFFB5654A);

  // Neutros / texto
  static const Color ink = Color(0xFF2A2118);
  static const Color inkSoft = Color(0xFF5A4E3F);
  static const Color error = Color(0xFFA23B3B);
  static const Color success = Color(0xFF4A7A5E);

  static const LinearGradient marbleGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [marble, marbleDark],
  );

  static const LinearGradient goldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [goldLight, gold, goldDark],
  );
}
