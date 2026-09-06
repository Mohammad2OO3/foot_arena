import 'package:flutter/material.dart';
import '../../common/helper/src/app_varibles.dart';
import '../../router/app_router.dart';

class NotificationNavigator {
  NotificationNavigator._();

  static void navigateFromData(Map<String, dynamic> data) {
    // التنقل إلى واجهة الإشعارات مباشرة لكل الحالات
    _goToNotification();
  }

  static void _goToNotification() {
    final navigator = AppVariables.navigatorKey.currentState;
    if (navigator == null) return;

    // الحصول على الـ Context الحالي للتحقق من اسم الواجهة الحالية
    final currentContext = AppVariables.navigatorKey.currentContext;

    if (currentContext != null) {
      final currentRoute = ModalRoute.of(currentContext);

      // إذا كان المستخدم متواجدًا بالفعل في واجهة الإشعارات، لا ننتقل إليها مجددًا
      if (currentRoute?.settings.name == RouteName.notificationScreen) {
        return;
      }
    }
    navigator.pushNamed(
      RouteName.notificationScreen,
    );
  }
}
