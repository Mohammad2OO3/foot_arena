import 'package:flutter/material.dart';
import 'color_palettes/app_colors.dart';

/// الواجهة الأساسية التي يجب أن تطبقها جميع ثيمات التطبيق
abstract class AppTheme {
  /// اسم الثيم (لأغراض العرض)
  String get name;

  /// معرف الثيم (لأغراض التخزين والمقارنة)
  String get id;

  /// بيانات ثيم Flutter الأساسية
  ThemeData get themeData;

  /// باليت الألوان الخاصة بهذا الثيم
  AppColorPalette get colors;

  /// أنماط النصوص الخاصة بالثيم
  TextTheme get textTheme;

  /// أنماط النصوص المعروضة على واجهات فاتحة
  TextTheme get lightTextTheme;

  /// أنماط النصوص المعروضة على واجهات داكنة
  TextTheme get darkTextTheme;

  /// أنماط الأزرار الأساسية
  ButtonThemeData get buttonTheme;

  /// نمط AppBar الأساسي
  AppBarTheme get appBarTheme;

  /// نمط بطاقات Card
  CardTheme get cardTheme;

  /// نمط حقول الإدخال
  InputDecorationTheme get inputDecorationTheme;

  /// نمط Dialog
  DialogTheme get dialogTheme;

  /// نمط FloatingActionButton
  FloatingActionButtonThemeData get floatingActionButtonTheme;

  /// نمط الـ SnackBar
  SnackBarThemeData get snackBarTheme;

  /// نمط الـ BottomNavigationBar
  BottomNavigationBarThemeData get bottomNavigationBarTheme;

  /// إنشاء نسخة من الثيم مع تعديلات محددة
  AppTheme copyWith({
    ThemeData? themeData,
    AppColorPalette? colors,
    TextTheme? textTheme,
  });

  /// تحويل الثيم لنسخة قابلة للتعديل (للإعدادات المتقدمة)
  AppTheme lerp(AppTheme other, double t);
}