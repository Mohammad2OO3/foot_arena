import 'package:flutter/material.dart';
import 'colors.dart';

class AppTypo  {
  // ========== Screen Titles ==========
  /// fontSize: 24, fontWeight: bold, white
  static const TextStyle screenTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.3,
    height: 1.2,
  );

  // ========== Section Headers ==========
  /// مثال: "Favorites"
  static const TextStyle sectionHeader = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.2,
    height: 1.3,
  );

  // ========== Card Titles ==========
  /// مثال: "Marcus Silva", "Arena Pro"
  static const TextStyle cardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  // ========== Subtitles/Labels ==========
  /// النص الفرعي داخل الكروت
  static const TextStyle subtitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  // ========== Buttons & Chips ==========
  static const TextStyle buttonLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: 0.5,
  );

  static const TextStyle buttonMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: 0.3,
  );

  static const TextStyle buttonSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: 0.2,
  );

  // ========== Button with Dark Text (for neon backgrounds) ==========
  static const TextStyle buttonOnNeon = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.background,
    letterSpacing: 0.3,
  );

  // ========== Caption/Overline ==========
  static const TextStyle caption = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    letterSpacing: 0.5,
  );

  // ========== Rating/Score ==========
  static const TextStyle rating = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.rating,
    letterSpacing: 0.2,
  );

  // ========== Player Stats ==========
  static const TextStyle statValue = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle statLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );

  AppTypo ._();
}