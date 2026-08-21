import 'package:flutter/material.dart';

class AppColors {
  // ========== Brand Colors ==========
  static const Color background = Color(0xFF0A1124);
  static const Color primary = Color(0xFF00E676);
  static const Color secondary = Color(0xFF673AB7);
  static const Color accent = Color(0xFFFF1744);

  // ========== Surface Colors ==========
  static const Color cardBackground = Color(0xFF16223F);
  static const Color subtleSurface = Color(0xFF0E162A);
  static const Color rating = Color(0xFFFFC107);

  // ========== Text Colors ==========
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF9E9E9E);

  // ========== Status Colors ==========
  static const Color online = Color(0xFF00E676);
  static const Color offline = Color(0xFF9E9E9E);
  static const Color busy = Color(0xFFFF1744);

  // ========== Glass Effect Colors ==========
  /// حدود زجاجية شفافة - white 5% opacity
  static const Color glassBorder = Color(0x0DFFFFFF);

  /// خلفية زجاجية شفافة - white 3% opacity
  static const Color glassOverlay = Color(0x08FFFFFF);

  // ========== Dark Variants ==========
  static const Color primaryDark = Color(0xFF00C853);
  static const Color secondaryDark = Color(0xFF512DA8);
  static const Color accentDark = Color(0xFFD50000);

  // ========== Gradients ==========
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient challengeGradient = LinearGradient(
    colors: [accent, Color(0xFF7C4DFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  AppColors._();
}