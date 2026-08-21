import 'package:flutter/material.dart';

import '../../design/design.dart';

// Context Extensions
extension ContextExtensions on BuildContext {
  bool canPop() => Navigator.of(this).canPop();

  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop<T>(result);

  Future<T?> pushNamed<T extends Object?>(String routeName,
          {Object? arguments}) =>
      Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) =>
      Navigator.of(this).pushReplacementNamed(routeName,
          result: result, arguments: arguments);

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
          String newRouteName, bool Function(Route<dynamic> route) predicate) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
        newRouteName,
        predicate,
      );

  Future<T?> popAndPushNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) =>
      Navigator.of(this).popAndPushNamed(
        routeName,
        result: result,
        arguments: arguments,
      );

  /// return screen size
  Size size() => MediaQuery.of(this).size;

  /// return screen width
  double get width => MediaQuery.of(this).size.width;

  /// return screen height
  double get height => MediaQuery.of(this).size.height;

  /// return screen devicePixelRatio
  double get pixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// returns brightness
  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;

  /// Return the height of status bar
  double get statusBarHeight => MediaQuery.of(this).padding.top;

  /// Return the height of navigation bar
  double get navigationBarHeight => MediaQuery.of(this).padding.bottom;

  /// Returns Theme.of(context)
  ThemeData get theme => Theme.of(this);

  /// Returns Theme.of(context).textTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Returns DefaultTextStyle.of(context)
  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);

  /// Returns Form.of(context)
  FormState? get formState => Form.of(this);

  /// Returns Scaffold.of(context)
  ScaffoldState get scaffoldState => Scaffold.of(this);

  /// Returns Overlay.of(context)
  OverlayState? get overlayState => Overlay.of(this);

  /// Returns primaryColor Color
  Color get primaryColor => theme.primaryColor;

  /// Returns accentColor Color
  Color get accentColor => theme.colorScheme.secondary;

  /// Returns scaffoldBackgroundColor Color
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;

  /// Request focus to given FocusNode
  void requestFocus(FocusNode focus) {
    FocusScope.of(this).requestFocus(focus);
  }

  /// Request focus to given FocusNode
  void unFocus(FocusNode focus) {
    focus.unfocus();
  }

  /// Return the height of status bar
  // bool get isArabic => locale == const Locale('ar');

  bool get isMobile => ResponsiveBreakpoints.of(this).isMobile;

  bool get isDesktop => ResponsiveBreakpoints.of(this).isDesktop;

  bool get isTablet => ResponsiveBreakpoints.of(this).isTablet;

  Orientation get orientation => MediaQuery.of(this).orientation;

  bool get isLandscape => orientation == Orientation.landscape;

  bool get isPortrait => orientation == Orientation.portrait;

  TargetPlatform get platform => Theme.of(this).platform;

  bool get isAndroid => platform == TargetPlatform.android;

  bool get isIOS => platform == TargetPlatform.iOS;

  void openDrawer() => Scaffold.of(this).openDrawer();

  void openEndDrawer() => Scaffold.of(this).openEndDrawer();
}
