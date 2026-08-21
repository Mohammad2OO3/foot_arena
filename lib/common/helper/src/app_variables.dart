import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/di/injection.dart';
import 'prefs_keys.dart';

class AppVariables {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static final SharedPreferences _pref = getIt<SharedPreferences>();

  static bool get firstOpen => _pref.getBool(PrefsKeys.firstOpen) ?? true;

  static set firstOpen(bool firstOpen) =>
      _pref.setBool(PrefsKeys.firstOpen, firstOpen);
}
