import 'package:flutter/material.dart';
import '../../../../common/extensions/src/context_extensions.dart';
import '../../../../common/helper/src/locale_keys.dart';
import '../../../../common/models/notification_model.dart';
import '../bloc/notification_bloc.dart';

class NotificationListTileWidget extends StatelessWidget {
  final NotificationBloc notificationBloc;
  final NotificationModel notificationModel;

  const NotificationListTileWidget({
    super.key,
    required this.notificationBloc,
    required this.notificationModel,
  });

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Icon(Icons.notification_add),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      notificationModel.data?.title??'Title',
                      style: context.labelSmall(fontSize: 16),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      notificationModel.data?.body??'Body',

                      style: context.bodySmall(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            height: 1,


            margin: EdgeInsets.symmetric(vertical: 24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.grey.withOpacity(0),
                  context.grey.withOpacity(.5),
                  context.grey.withOpacity(0),
                ],
                begin: AlignmentDirectional.centerStart,
                end: AlignmentDirectional.centerEnd,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String formatNotificationTime(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return LocaleKeys.noDate.tr();
  }

  final dateTime = DateTime.parse(dateString);
  final now = DateTime.now();
  final diff = now.difference(dateTime);

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  String formatTime(DateTime dt) {
    final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final period = dt.hour < 12 ? LocaleKeys.am.tr() : LocaleKeys.pm.tr();

    return '${twoDigits(hour)}:${twoDigits(dt.minute)} $period';
  }

  /// أقل من دقيقة
  if (diff.inSeconds < 60) {
    return LocaleKeys.now.tr();
  }

  /// دقائق
  if (diff.inMinutes < 60) {
    if (diff.inMinutes == 1) {
      return LocaleKeys.minuteAgo.tr();
    }
    return LocaleKeys.minutesAgo.tr(
      namedArgs: {'count': diff.inMinutes.toString()},
    );
  }

  /// ساعات
  if (diff.inHours < 24) {
    final hours = diff.inHours;
    final minutes = diff.inMinutes % 60;

    if (minutes == 0) {
      return hours == 1
          ? LocaleKeys.hourAgo.tr()
          : LocaleKeys.hoursAgo.tr(namedArgs: {'hours': hours.toString()});
    }

    return LocaleKeys.hoursMinutesAgo.tr(
      namedArgs: {'hours': hours.toString(), 'minutes': minutes.toString()},
    );
  }

  /// البارحة
  if (diff.inDays == 1) {
    return LocaleKeys.yesterdayAt.tr(namedArgs: {'time': formatTime(dateTime)});
  }

  /// أقل من 6 أيام
  if (diff.inDays <= 6) {
    final dayKey =
        [
          LocaleKeys.monday,
          LocaleKeys.tuesday,
          LocaleKeys.wednesday,
          LocaleKeys.thursday,
          LocaleKeys.friday,
          LocaleKeys.saturday,
          LocaleKeys.sunday,
        ][dateTime.weekday - 1];

    return LocaleKeys.dayAt.tr(
      namedArgs: {'day': dayKey.tr(), 'time': formatTime(dateTime)},
    );
  }

  /// أكثر من 6 أيام
  final date =
      '${twoDigits(dateTime.day)}/${twoDigits(dateTime.month)}/${dateTime.year}';

  return LocaleKeys.dateAt.tr(
    namedArgs: {'date': date, 'time': formatTime(dateTime)},
  );
}
