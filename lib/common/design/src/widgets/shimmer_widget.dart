import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../extensions/src/context_extensions.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    super.key,
    this.width,
    this.height,
    this.border,
    this.shape = BoxShape.rectangle,
    this.padding = EdgeInsets.zero,
    this.borderRadius,
  });
  final double? width;
  final double? height;
  final Border? border;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Shimmer.fromColors(
        baseColor: context.primaryColor.withOpacity(.1),
        highlightColor: context.primaryColor.withOpacity(.6),
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: context.primaryColor.withOpacity(.6),
            shape: shape,
            border: border,
            borderRadius: borderRadius,
          ),
        ),
      ),
    );
  }
}
