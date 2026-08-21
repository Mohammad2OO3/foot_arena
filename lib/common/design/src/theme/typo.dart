import 'package:flutter/material.dart';

import 'theme/theme_extensions.dart';


final TextTheme _baseTextTheme = const TextTheme(
  displayLarge: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
  displayMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
  displaySmall: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
 ////////////////////////
  headlineLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
  headlineMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
  headlineSmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300),
 /////////////////////////////
  labelLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
  labelMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
  labelSmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
/////////////////////////////////
  titleLarge: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
  titleMedium: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
  titleSmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w300),
  bodyLarge: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w700),
  bodyMedium: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w600),
  bodySmall: TextStyle(fontSize: 8.0, fontWeight: FontWeight.w300),
);

TextTheme getTextTheme(AppThemeExtensions themeExt) {
  return _baseTextTheme.copyWith(
    displayLarge: _baseTextTheme.displayLarge?.copyWith(color: themeExt.palette.primary),
    displayMedium: _baseTextTheme.displayMedium?.copyWith(color: themeExt.palette.primary),
    displaySmall: _baseTextTheme.displaySmall?.copyWith(color: themeExt.palette.primary),
    headlineLarge: _baseTextTheme.headlineLarge?.copyWith(color: themeExt.palette.textColor),
    headlineMedium: _baseTextTheme.headlineMedium?.copyWith(color: themeExt.palette.textColor),
    headlineSmall: _baseTextTheme.headlineSmall?.copyWith(color: themeExt.palette.textColor),
    labelLarge: _baseTextTheme.labelLarge?.copyWith(color: themeExt.palette.textColor),
    labelMedium: _baseTextTheme.labelMedium?.copyWith(color: themeExt.palette.textColor),
    labelSmall: _baseTextTheme.labelSmall?.copyWith(color: themeExt.palette.textColor),


    titleLarge: _baseTextTheme.titleLarge?.copyWith(color: Colors.white),
    titleMedium: _baseTextTheme.titleMedium?.copyWith(color: Colors.white),
    titleSmall: _baseTextTheme.titleSmall?.copyWith(color: Colors.white),
  bodyLarge: _baseTextTheme.bodyLarge?.copyWith(color: themeExt.palette.grey),
    bodyMedium: _baseTextTheme.bodyMedium?.copyWith(color: themeExt.palette.grey),
    bodySmall: _baseTextTheme.bodySmall?.copyWith(color: themeExt.palette.grey),
  );
}





