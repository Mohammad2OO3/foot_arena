
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../extensions/extensions.dart';

class SvgAsset extends StatelessWidget {
  const SvgAsset(
    this.assetName, {
    super.key,
    this.color,
    this.withOutColor = false,
    this.width = 25,
    this.height = 25,
  });
  final Color? color;
  final double width;
  final double height;
  final bool withOutColor;
  final String assetName;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      // ignore: deprecated_member_use
      color: color ?? (withOutColor ? null : context.primaryColor),
      width: width,
      height: height,
    );
  }
}
