import 'package:flutter/material.dart';

extension StringExtentions on String? {
  toColor() {
    if (this == null || this!.isEmpty) {
      return Colors.black;
    }
    var hexStringColor = this;
    final buffer = StringBuffer();

    if (hexStringColor!.length == 6 || hexStringColor.length == 7) {
      buffer.write('ff');
      buffer.write(hexStringColor.replaceFirst("#", ""));
      return Color(int.parse(buffer.toString(), radix: 16));
    }
  }
}
