import 'package:flutter/material.dart';
import '../../helper/helper.dart';

extension DateTimeFormatting on DateTime {
  String formatEnglishTimeWithLocale(BuildContext context) {
    final timeNumbers = DateFormat('h:mm', 'en').format(this);
    final amPm = DateFormat('a', context.locale.languageCode).format(this);
    return "$timeNumbers $amPm";
  }

  String formatEnglishDate() {
    return DateFormat('dd / MM / yyyy','en').format(this);
  }
}