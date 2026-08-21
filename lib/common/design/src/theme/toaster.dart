import 'package:flutter/material.dart';
import 'colors.dart';
import 'typo.dart';
import 'const.dart';

class Toaster {
  Toaster._();

  /// SnackBar نجاح - أخضر
  static void showSuccess(BuildContext context, String message) {
    _show(
      context,
      message,
      Icons.check_circle_rounded,
      AppColors.primary,
    );
  }

  /// SnackBar خطأ - أحمر
  static void showError(BuildContext context, String message) {
    _show(
      context,
      message,
      Icons.cancel_rounded,
      AppColors.accent,
      borderColor: AppColors.accent,
    );
  }

  /// SnackBar معلومات - بنفسجي
  static void showInfo(BuildContext context, String message) {
    _show(
      context,
      message,
      Icons.info_rounded,
      AppColors.secondary,
    );
  }

  /// SnackBar تحذير - أصفر
  static void showWarning(BuildContext context, String message) {
    _show(
      context,
      message,
      Icons.warning_rounded,
      AppColors.rating,
      borderColor: AppColors.rating,
      textColor: AppColors.textPrimary,
    );
  }

  /// دالة خاصة لبناء الـ SnackBar
  static void _show(
      BuildContext context,
      String message,
      IconData icon,
      Color iconColor, {
        Color? borderColor,
        Color? textColor,
      })
  {
    // نخفي أي SnackBar موجود قبل ما نعرض الجديد
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            // أيقونة الحالة
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconColor.withOpacity(0.15),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 16,
              ),
            ),
            const SizedBox(width: 12),
            // الرسالة النصية
            Expanded(
              child: Text(
                message,
                style: AppTypo.subtitle.copyWith(
                  color: textColor ?? AppColors.textPrimary,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            // زر الإغلاق
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: const Icon(
                Icons.close,
                color: AppColors.textSecondary,
                size: 18,
              ),
            ),
          ],
        ),
        backgroundColor: AppColors.cardBackground,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: borderColor ?? AppColors.glassBorder,
            width: 1.0,
          ),
        ),
        duration: const Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}