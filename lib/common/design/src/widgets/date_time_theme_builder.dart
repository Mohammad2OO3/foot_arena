import 'package:flutter/material.dart';

import '../../../extensions/src/context_extensions.dart';

TransitionBuilder dateTimeThemeBuilder() {
  return (context, child) {
    return Theme(
      data: context.theme.copyWith(
        datePickerTheme: DatePickerThemeData(
          headerHeadlineStyle: context.bodySmall(
            fontSize: 32,

          ),
          headerHelpStyle: context.bodyMedium(
            fontSize: 14,

          ),
          weekdayStyle: context.bodyMedium(
              fontSize: 16
          ),

          dayStyle: context.bodyMedium(
              fontSize: 16
          ),
          yearStyle: context.bodyMedium(
              fontSize: 16
          ),
          cancelButtonStyle: ButtonStyle(
            textStyle: WidgetStatePropertyAll(
              context.bodyMedium(

                fontSize: 14,
              ),
            ),
          ),
          confirmButtonStyle: ButtonStyle(
            textStyle: WidgetStatePropertyAll(
              context.bodyMedium(

                fontSize: 14,
              ),
            ),
          ),
          rangePickerHeaderHeadlineStyle: context.bodyMedium(
              fontSize: 16
          ),
          rangePickerHeaderHelpStyle: context.bodyMedium(
              fontSize: 16
          ),
          toggleButtonTextStyle: context.bodyMedium(
              fontSize: 16
          ),

        ),
      ),
      child: child!,
    );
  };

}