// import 'package:flutter/material.dart';
//
// import '../../../../common/design/src/theme/assets.gen.dart';
// import '../../../../common/extensions/src/context_extensions.dart';
//
// class NotificationLeadingIconWidget extends StatelessWidget {
//   final String? type;
//
//   const NotificationLeadingIconWidget({super.key, required this.type});
//
//   @override
//   Widget build(BuildContext context) {
//     late final Color color;
//     late final String svgIcon;
//     switch (type) {
//       case 'order_assigned':
//         color = context.notificationRequest;
//         svgIcon = Assets.images.svg.notification.add;
//         break;
//
//       case 'order_completed':
//         color = context.notificationOrderCompleted;
//         svgIcon = Assets.images.svg.notification.comlete;
//         break;
//
//       case 'order_cancelled':
//         color = context.notificationDelete;
//         svgIcon = Assets.images.svg.notification.deleteCar;
//         break;
//
//
//         case 'instant_service_request':
//         color = context.notificationOrderCompleted;
//         svgIcon = Assets.images.svg.notification.request;
//         break;
//         case 'instant_service_confirmed':
//         color = context.notificationOrderCompleted;
//         svgIcon = Assets.images.svg.notification.request;
//         break;
//
//
//       case 'accessory_order_assigned':
//         color = context.notificationRequest;
//         svgIcon = Assets.images.svg.notification.add;
//         break;
//
//       case 'accessory_order_completed':
//         color = context.notificationOrderCompleted;
//         svgIcon = Assets.images.svg.notification.comlete;
//         break;
//       case 'accessory_order_cancelled':
//         color = context.notificationDelete;
//         svgIcon = Assets.images.svg.notification.deleteCar;
//         break;
//
//
//       case 'banner':
//         color = context.notificationAttention;
//         svgIcon = Assets.images.svg.notification.attenshen;
//         break;
//       case 'new_service':
//         color = context.notificationRequest;
//         svgIcon = Assets.images.svg.notification.request;
//         break;
//
//       default:
//         color = context.notificationAttention;
//         svgIcon = Assets.images.svg.notification.attenshen;
//     }
//     return SolidShadowButtonWidget(color: color, svgIcon: svgIcon);
//   }
//
//
// }
