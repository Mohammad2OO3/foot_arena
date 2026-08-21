// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgAsset extends StatelessWidget {
  const SvgAsset(
    this.assetName, {
    super.key,
    this.color,
    this.width = 25,
    this.height = 25,

  });
  final Color? color;
  final double width;
  final double height;

  final String assetName;
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      color: color,
      width: width,
      height: height,
      fit: BoxFit.cover,


    );
  }
}

//
// class FixedSvgAsset extends StatelessWidget {
//   final String assetName;
//   final double width;
//   final double height;
//   final Color? color;
//   final BoxFit fit;
//
//   const FixedSvgAsset({
//     super.key,
//     required this.assetName,
//      this.width=25,
//      this.height=25,
//     this.color,
//     this.fit = BoxFit.fill,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: width,
//       height: height,
//       child: SvgPicture.asset(
//         assetName,
//         color: color,
//         fit: fit, // fill to match exact dimensions
//       ),
//     );
//   }
// }
