import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../design/design.dart';
import '../../design/src/theme/theme/theme_extensions.dart';
import '../../design/src/theme/theme/theme_notifier.dart';

extension NavigationContextExtensions on BuildContext {
  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop<T>(result);

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) => Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) => Navigator.of(
    this,
  ).pushReplacementNamed(routeName, result: result, arguments: arguments);

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
    String newRouteName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) => Navigator.of(
    this,
  ).pushNamedAndRemoveUntil(newRouteName, predicate, arguments: arguments);

  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) => Navigator.of(
    this,
  ).popAndPushNamed(routeName, result: result, arguments: arguments);


}

// امتدادات الوسائط والشاشة
extension MediaContextExtensions on BuildContext {
  Size size() => MediaQuery.of(this).size;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  double get pixelRatio => MediaQuery.of(this).devicePixelRatio;

  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;

  double get statusBarHeight => MediaQuery.of(this).padding.top;

  double get navigationBarHeight => MediaQuery.of(this).padding.bottom;

  Orientation get orientation => MediaQuery.of(this).orientation;

  bool get isLandscape => orientation == Orientation.landscape;

  bool get isPortrait => orientation == Orientation.portrait;
}

// امتدادات الثيم
extension ThemeContextExtensions on BuildContext {
  AppThemeExtensions get themeExt =>
      Theme.of(this).extension<AppThemeExtensions>()!;

  // اختصارات الألوان الرئيسية
  Color get notificationOrderCompleted => themeExt.palette.notificationOrderCompleted;
  Color get notificationAttention => themeExt.palette.notificationAttention;
  Color get notificationAdd => themeExt.palette.notificationAdd;
  Color get notificationDelete => themeExt.palette.notificationDelete;
  Color get notificationSchuled => themeExt.palette.notificationSchuled;
  Color get notificationRequest => themeExt.palette.notificationRequest;
  Color get primarySwatch => themeExt.palette.primarySwatch;
  Color get borderGradientStartColor => themeExt.palette.borderGradientStartColor;
  Color get borderGradientEndColor => themeExt.palette.borderGradientEndColor;
  Color get carProfileColor => themeExt.palette.carProfileColor;

  Color get primarySwatchOpacity => themeExt.palette.primarySwatch[300]!;

  Color get secondaryColor => themeExt.palette.secondarySwatch;

  Color get onPrimaryColor => themeExt.palette.onPrimary;

  Color get primaryContainerColor => themeExt.palette.primaryContainer;

  Color get onPrimaryContainerColor => themeExt.palette.onPrimaryContainer;

  Color get onSecondaryColor => themeExt.palette.onSecondary;

  Color get secondaryContainerColor => themeExt.palette.secondaryContainer;

  Color get onSecondaryContainerColor => themeExt.palette.onSecondaryContainer;

  Color get tertiaryColor => themeExt.palette.tertiary;

  Color get onTertiaryColor => themeExt.palette.onTertiary;

  Color get tertiaryContainerColor => themeExt.palette.tertiaryContainer;

  Color get onTertiaryContainerColor => themeExt.palette.onTertiaryContainer;

  Color get errorColor => themeExt.palette.error;

  Color get onErrorColor => themeExt.palette.onError;

  Color get errorContainerColor => themeExt.palette.errorContainer;

  Color get onErrorContainerColor => themeExt.palette.onErrorContainer;

  Color get backgroundColor => themeExt.palette.background;

  Color get onBackgroundColor => themeExt.palette.onBackground;

  Color get surfaceColor => themeExt.palette.surface;

  Color get onSurfaceColor => themeExt.palette.onSurface;

  Color get surfaceVariantColor => themeExt.palette.surfaceVariant;

  Color get onSurfaceVariantColor => themeExt.palette.onSurfaceVariant;

  Color get outlineColor => themeExt.palette.outline;

  Color get shadowColor => themeExt.palette.shadow;

  Color get inverseSurfaceColor => themeExt.palette.inverseSurface;

  Color get onInverseSurfaceColor => themeExt.palette.onInverseSurface;

  Color get inversePrimaryColor => themeExt.palette.inversePrimary;

  Color get cardColor => themeExt.palette.card;

  Color get cardHighlightedColor => themeExt.palette.cardHighlighted;

  Color get disabledColor => themeExt.palette.disabled;

  Color get dividerColor => themeExt.palette.divider;

  Color get textFieldBorderColor => themeExt.palette.textFieldBorder;

  Color get textFieldBackgroundColor => themeExt.palette.textFieldBackground;

  Color get textFieldHintColor => themeExt.palette.textFieldHintColor;

  Color get textColor => themeExt.palette.textColor;

  Color get blackColor => themeExt.palette.black;

  Color get grey => themeExt.palette.grey;

  Color get successColor => themeExt.palette.success;

  Color get warningColor => themeExt.palette.warning;

  Color get infoColor => themeExt.palette.info;

  Color get textFieldBorder => themeExt.palette.textFieldBorder;

  Color get fieldLabelColor => themeExt.palette.fieldLabelColor;

  Color get langColor => themeExt.palette.langColor;

  Color get numberColor => themeExt.palette.numberColor;

  Color get shareColor => themeExt.palette.shareColor;

  Color get versionColor => themeExt.palette.versionColor;

  Color get starsRateColor => themeExt.palette.starsRateColor;

  // InputDecorationTheme get inputDecorationTheme =>
  //     Theme.of(this).inputDecorationTheme;

  //
  // // اختصارات أنواع الخطوط مع إمكانية تعديل اللون والحجم والوزن
  // TextStyle? displayLarge({
  //   Color? color,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  // }) =>
  //     Theme.of(this).textTheme.displayLarge?.copyWith(
  //       color: color ?? themeExt.palette.primary,
  //       fontSize: fontSize,
  //       fontWeight: fontWeight,
  //     );
  //
  // TextStyle? displayMedium({
  //   Color? color,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  // }) =>
  //     Theme.of(this).textTheme.displayMedium?.copyWith(
  //       color: color ?? themeExt.palette.primary,
  //       fontSize: fontSize,
  //       fontWeight: fontWeight,
  //     );
  //
  // TextStyle? displaySmall({
  //   Color? color,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  // }) =>
  //     Theme.of(this).textTheme.displaySmall?.copyWith(
  //       color: color ?? themeExt.palette.primary,
  //       fontSize: fontSize,
  //       fontWeight: fontWeight,
  //     );
  //
  // TextStyle? headlineLarge({
  //   Color? color,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  // }) =>
  //     Theme.of(this).textTheme.headlineLarge?.copyWith(
  //       color: color ?? themeExt.palette.black,
  //       fontSize: fontSize,
  //       fontWeight: fontWeight,
  //     );
  //
  // TextStyle? headlineMedium({
  //   Color? color,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  // }) =>
  //     Theme.of(this).textTheme.headlineMedium?.copyWith(
  //       color: color ?? themeExt.palette.black,
  //       fontSize: fontSize,
  //       fontWeight: fontWeight,
  //     );
  //
  // TextStyle? headlineSmall({
  //   Color? color,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  // }) =>
  //     Theme.of(this).textTheme.headlineSmall?.copyWith(
  //       color: color ?? themeExt.palette.black,
  //       fontSize: fontSize,
  //       fontWeight: fontWeight,
  //     );
  //
  // TextStyle? titleLarge({
  //   Color? color,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  // }) =>
  //     Theme.of(this).textTheme.titleLarge?.copyWith(
  //       color: color ?? Colors.white,
  //       fontSize: fontSize,
  //       fontWeight: fontWeight,
  //     );
  //
  // TextStyle? titleMedium({
  //   Color? color,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  // }) =>
  //     Theme.of(this).textTheme.titleMedium?.copyWith(
  //       color: color ?? Colors.white,
  //       fontSize: fontSize,
  //       fontWeight: fontWeight,
  //     );
  //
  // TextStyle? titleSmall({
  //   Color? color,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  // }) =>
  //     Theme.of(this).textTheme.titleSmall?.copyWith(
  //       color: color ?? Colors.white,
  //       fontSize: fontSize,
  //       fontWeight: fontWeight,
  //     );
  //
  // TextStyle? labelLarge({
  //   Color? color,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  // }) =>
  //     Theme.of(this).textTheme.labelLarge?.copyWith(
  //       color: color ?? themeExt.palette.textColor,
  //       fontSize: fontSize,
  //       fontWeight: fontWeight,
  //     );
  //
  // TextStyle? labelMedium({
  //   Color? color,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  // }) =>
  //     Theme.of(this).textTheme.labelMedium?.copyWith(
  //       color: color ?? themeExt.palette.textColor,
  //       fontSize: fontSize,
  //       fontWeight: fontWeight,
  //     );
  //
  // TextStyle? labelSmall({
  //   Color? color,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  // }) =>
  //     Theme.of(this).textTheme.labelSmall?.copyWith(
  //       color: color ?? themeExt.palette.textColor,
  //       fontSize: fontSize,
  //       fontWeight: fontWeight,
  //     );
  //
  // TextStyle? bodyLarge({
  //   Color? color,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  // }) =>
  //     Theme.of(this).textTheme.bodyLarge?.copyWith(
  //       color: color ?? themeExt.palette.textFieldHintColor,
  //       fontSize: fontSize,
  //       fontWeight: fontWeight,
  //     );
  //
  // TextStyle? bodyMedium({
  //   Color? color,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  // }) =>
  //     Theme.of(this).textTheme.bodyMedium?.copyWith(
  //       color: color ?? themeExt.palette.textFieldHintColor,
  //       fontSize: fontSize,
  //       fontWeight: fontWeight,
  //     );
  //
  // TextStyle? bodySmall({
  //   Color? color,
  //   double? fontSize,
  //   FontWeight? fontWeight,
  // }) =>
  //     Theme.of(this).textTheme.bodySmall?.copyWith(
  //       color: color ?? themeExt.palette.textFieldHintColor,
  //       fontSize: fontSize,
  //       fontWeight: fontWeight,
  //     );

  // إدارة الثيم
  // void toggleTheme() => read<AppThemeNotifier>().toggleTheme();

  void setTheme(AppThemeType theme) => read<AppThemeNotifier>().setTheme(theme);

  bool get isDarkMode => theme.brightness == Brightness.dark;
}

extension TextStyleExtensions on BuildContext {
  TextStyle? displayLarge({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) => _applyStyle(
    textTheme.displayLarge,
    color,
    fontSize,
    fontWeight,
    fontFamily: fontFamily,
  );

  TextStyle? displayMedium({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) => _applyStyle(
    textTheme.displayMedium,
    color,
    fontSize,
    fontWeight,
    fontFamily: fontFamily,
  );

  TextStyle? displaySmall({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) => _applyStyle(
    textTheme.displaySmall,
    color,
    fontSize,
    fontWeight,
    fontFamily: fontFamily,
  );

  TextStyle? headlineLarge({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) => _applyStyle(
    textTheme.headlineLarge,
    color,
    fontSize,
    fontWeight,
    fontFamily: fontFamily,
  );

  TextStyle? headlineMedium({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) => _applyStyle(
    textTheme.headlineMedium,
    color,
    fontSize,
    fontWeight,
    fontFamily: fontFamily,
  );

  TextStyle? headlineSmall({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) => _applyStyle(
    textTheme.headlineSmall,
    color,
    fontSize,
    fontWeight,
    fontFamily: fontFamily,
  );

  TextStyle? titleLarge({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) => _applyStyle(
    textTheme.titleLarge,
    color,
    fontSize,
    fontWeight,
    fontFamily: fontFamily,
  );

  TextStyle? titleMedium({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) => _applyStyle(
    textTheme.titleMedium,
    color,
    fontSize,
    fontWeight,
    fontFamily: fontFamily,
  );

  TextStyle? titleSmall({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) => _applyStyle(
    textTheme.titleSmall,
    color,
    fontSize,
    fontWeight,
    fontFamily: fontFamily,
  );

  TextStyle? labelLarge({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) => _applyStyle(
    textTheme.labelLarge,
    color,
    fontSize,
    fontWeight,
    fontFamily: fontFamily,
  );

  TextStyle? labelMedium({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) => _applyStyle(
    textTheme.labelMedium,
    color,
    fontSize,
    fontWeight,
    fontFamily: fontFamily,
  );

  TextStyle? labelSmall({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) => _applyStyle(
    textTheme.labelSmall,
    color,
    fontSize,
    fontWeight,
    fontFamily: fontFamily,
  );

  TextStyle? bodyLarge({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) => _applyStyle(
    textTheme.bodyLarge,
    color,
    fontSize,
    fontWeight,
    fontFamily: fontFamily,
  );

  TextStyle? bodyMedium({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) => _applyStyle(
    textTheme.bodyMedium,
    color,
    fontSize,
    fontWeight,
    fontFamily: fontFamily,
  );

  TextStyle? bodySmall({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    String? fontFamily,
  }) => _applyStyle(
    textTheme.bodySmall,
    color,
    fontSize,
    fontWeight,
    fontFamily: fontFamily,
  );

  TextTheme get textTheme => Theme.of(this).textTheme;

  TextStyle? _applyStyle(
    TextStyle? base,
    Color? color,
    double? size,
    FontWeight? weight, {
    String? fontFamily,
  }) {
    final colorFinal = color ?? base?.color;
    final fontSizeFinal = size ?? base?.fontSize;
    final fontWeightFinal = weight ?? base?.fontWeight;

    if (fontFamily != null) {
      // استخدم الخط المحلي المحدد
      return base?.copyWith(
        fontFamily: fontFamily,
        color: colorFinal,
        fontSize: fontSizeFinal,
        fontWeight: fontWeightFinal,
      );
    }

    // الافتراضي: GoogleFonts.alexandria كما عندك الآن
    return GoogleFonts.alexandria(textStyle: base).copyWith(
      color: colorFinal,
      fontSize: fontSizeFinal,
      fontWeight: fontWeightFinal,
    );
  }
}

// امتدادات الواجهة
extension ScaffoldContextExtensions on BuildContext {
  ScaffoldState get scaffoldState => Scaffold.of(this);

  void openDrawer() => Scaffold.of(this).openDrawer();

  void openEndDrawer() => Scaffold.of(this).openEndDrawer();
}

// امتدادات أخرى
extension OtherContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  FormState? get formState => Form.of(this);

  OverlayState? get overlayState => Overlay.of(this);

  Color get accentColor => theme.colorScheme.secondary;

  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  TargetPlatform get platform => Theme.of(this).platform;

  bool get isAndroid => platform == TargetPlatform.android;

  bool get isIOS => platform == TargetPlatform.iOS;

  bool get isMobile => ResponsiveBreakpoints.of(this).isMobile;

  bool get isDesktop => ResponsiveBreakpoints.of(this).isDesktop;

  bool get isTablet => ResponsiveBreakpoints.of(this).isTablet;

  void requestFocus(FocusNode focus) {
    FocusScope.of(this).requestFocus(focus);
  }

  void unFocus(FocusNode focus) {
    focus.unfocus();
  }
}

//// استخدام بسيط مع القيم الافتراضية
// Text('عرض كبير', style: context.displayLarge());
//
// // تخصيص كامل
// Text('عنوان مخصص', style: context.headlineMedium(
//   color: Colors.red,
//   fontSize: 28,
//   fontWeight: FontWeight.w800,
// ));
//
// // تغيير حجم الخط فقط
// Text('نص متوسط', style: context.bodyMedium(fontSize: 20));
//
// // تغيير السمك فقط
// Text('نص غامق', style: context.labelSmall(fontWeight: FontWeight.bold));
