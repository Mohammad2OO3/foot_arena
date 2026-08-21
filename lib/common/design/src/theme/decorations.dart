import 'package:flutter/material.dart';
import 'colors.dart';
import 'const.dart';
import 'typo.dart';

class AppDecorations {
  AppDecorations._();

  // ========== Glass Card Decoration ==========
  /// البطاقة الزجاجية الأساسية
  static BoxDecoration glassCard({
    double? radius,
    Color? backgroundColor,
  }) {
    return BoxDecoration(
      color: backgroundColor ?? PColors.cardBackground,
      borderRadius: BorderRadius.circular(radius ?? AppConst.radiusCard),
      border: Border.all(
        color: PColors.glassBorder,
        width: 1.0,
      ),
    );
  }

  /// بطاقة زجاجية مع تأثير توهج خفيف
  static BoxDecoration glassCardGlow({
    Color? glowColor,
  }) {
    return BoxDecoration(
      color: PColors.cardBackground,
      borderRadius: BorderRadius.circular(AppConst.radiusCard),
      border: Border.all(
        color: (glowColor ?? PColors.primary).withOpacity(0.1),
        width: 1.0,
      ),
      boxShadow: [
        BoxShadow(
          color: (glowColor ?? PColors.primary).withOpacity(0.05),
          blurRadius: 20,
          spreadRadius: 0,
        ),
      ],
    );
  }

  // ========== Input Field Decoration ==========
  /// حقل إدخال زجاجي
  static InputDecoration glassInput({
    required String hintText,
    Widget? prefixIcon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: AppTypo.subtitle,
      prefixIcon: prefixIcon != null
          ? Padding(
        padding: const EdgeInsets.only(left: 12, right: 8),
        child: prefixIcon,
      )
          : null,
      suffixIcon: suffixIcon != null
          ? Padding(
        padding: const EdgeInsets.only(left: 8, right: 12),
        child: suffixIcon,
      )
          : null,
      prefixIconConstraints: const BoxConstraints(
        minWidth: 20,
        minHeight: 20,
      ),
      suffixIconConstraints: const BoxConstraints(
        minWidth: 20,
        minHeight: 20,
      ),
      filled: true,
      fillColor: PColors.cardBackground,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConst.radiusInput),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConst.radiusInput),
        borderSide: const BorderSide(
          color: PColors.glassBorder,
          width: 1.0,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConst.radiusInput),
        borderSide: const BorderSide(
          color: PColors.primary,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConst.radiusInput),
        borderSide: const BorderSide(
          color: PColors.accent,
          width: 1.0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConst.radiusInput),
        borderSide: const BorderSide(
          color: PColors.accent,
          width: 1.5,
        ),
      ),
    );
  }

  // ========== Button Decoration ==========
  /// زر أساسي بخلفية نيون خضراء
  static ButtonStyle primaryButton({
    double? width,
    double? height,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: PColors.primary,
      foregroundColor: PColors.background,
      disabledBackgroundColor: PColors.primary.withOpacity(0.3),
      minimumSize: Size(
        width ?? double.infinity,
        height ?? AppConst.inputHeight,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConst.radiusInput),
      ),
      elevation: 0,
      textStyle: AppTypo.buttonOnNeon,
    );
  }

  /// زر التحدي - أحمر ناري
  static ButtonStyle challengeButton({
    double? width,
    double? height,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: PColors.accent,
      foregroundColor: PColors.textPrimary,
      minimumSize: Size(
        width ?? double.infinity,
        height ?? AppConst.inputHeight,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConst.radiusInput),
      ),
      elevation: 0,
      textStyle: AppTypo.buttonLarge,
    );
  }

  /// زر شفاف زجاجي
  static ButtonStyle glassButton({
    double? width,
    double? height,
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: PColors.cardBackground,
      foregroundColor: PColors.textPrimary,
      minimumSize: Size(
        width ?? double.infinity,
        height ?? AppConst.buttonHeightMd,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConst.radiusInput),
        side: const BorderSide(
          color: PColors.glassBorder,
          width: 1.0,
        ),
      ),
      elevation: 0,
      textStyle: AppTypo.buttonMedium,
    );
  }

  // ========== Chip Decoration ==========
  /// شيب فلتر
  static BoxDecoration chipDecoration({
    bool isSelected = false,
  }) {
    return BoxDecoration(
      color: isSelected
          ? PColors.primary.withOpacity(0.15)
          : PColors.cardBackground,
      borderRadius: BorderRadius.circular(AppConst.radiusChip),
      border: Border.all(
        color: isSelected
            ? PColors.primary.withOpacity(0.3)
            : PColors.glassBorder,
        width: 1.0,
      ),
    );
  }

  // ========== Tag Decoration ==========
  /// تاج الحالة (Online, Offline)
  static BoxDecoration statusTag({
    required bool isOnline,
  }) {
    return BoxDecoration(
      color: (isOnline ? PColors.online : PColors.offline).withOpacity(0.15),
      borderRadius: BorderRadius.circular(AppConst.radiusTag),
      border: Border.all(
        color: (isOnline ? PColors.online : PColors.offline).withOpacity(0.3),
        width: 1.0,
      ),
    );
  }

  /// تاج التقييم
  static BoxDecoration ratingTag() {
    return BoxDecoration(
      color: PColors.rating.withOpacity(0.15),
      borderRadius: BorderRadius.circular(AppConst.radiusTag),
      border: Border.all(
        color: PColors.rating.withOpacity(0.3),
        width: 1.0,
      ),
    );
  }

  // ========== Avatar Decoration ==========
  /// صورة شخصية دائرية بحدود نيون
  static BoxDecoration avatarDecoration({
    double size = AppConst.avatarMd,
    bool isOnline = false,
  }) {
    return BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: isOnline ? PColors.online : PColors.glassBorder,
        width: 2.0,
      ),
      boxShadow: isOnline
          ? [
        BoxShadow(
          color: PColors.online.withOpacity(0.3),
          blurRadius: 8,
          spreadRadius: 0,
        ),
      ]
          : null,
    );
  }

  // ========== Gradient Decorations ==========
  /// خلفية متدرجة للـ Headers
  static BoxDecoration gradientHeader() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [
          PColors.background,
          PColors.subtleSurface,
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    );
  }
}