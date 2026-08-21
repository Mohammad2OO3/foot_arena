import 'package:flutter/material.dart';

import '../../../extensions/src/context_extensions.dart';
import '../../design.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.textTitle,
    this.onPressed,
    required this.borderSide,
    required this.backgroundColor,
    required this.textColor,
    this.height,
    this.iconSpace = false,
    this.isEndIcon = false,
    this.width,
    this.icon,
    this.padding,
    this.fontSize,
  });
  const CustomButton.primary({
    super.key,
    this.height,
    this.width,
    this.textTitle,
    this.onPressed,
    this.iconSpace = false,
    this.icon,
    this.isEndIcon = false,
    this.backgroundColor = PColors.primarySwatch,
    this.padding,
    this.fontSize,
    this.textColor = Colors.white,
  }) : borderSide = BorderSide.none;

  CustomButton.withBorder({
    super.key,
    this.height,
    this.width,
    this.textTitle,
    this.onPressed,
    this.icon,
    this.iconSpace = false,
    Color color = PColors.primarySwatch,
    this.isEndIcon = false,
    this.padding,
    this.fontSize,
    this.backgroundColor = PColors.scaffoldBackground,
  })  : borderSide = BorderSide(
          color: color,
          width: 1,
        ),
        textColor = color;
  final Widget? icon;
  final String? textTitle;
  final VoidCallback? onPressed;

  final Color backgroundColor;
  final BorderSide borderSide;
  final Color textColor;
  final double? width;
  final double? height;
  final bool iconSpace;
  final bool isEndIcon;
  final EdgeInsetsGeometry? padding;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        disabledBackgroundColor: backgroundColor,
        minimumSize: Size(
          width ?? context.width * .9,
          height ?? 56,
        ),
        maximumSize: Size(
          width ?? context.width * .9,
          height ?? 56,
        ),
        padding: padding,
        shape: RoundedRectangleBorder(
          side: borderSide,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null && !isEndIcon) icon!,
          if (icon != null && iconSpace && isEndIcon) Container(),
          if (icon != null && iconSpace) const Spacer(),
          if (icon != null && textTitle != null) Space.hM1,
          if (textTitle != null)
            FittedBox(
              child: Text(
                textTitle!,
                style: context.textTheme.titleMedium?.copyWith(
                  color: textColor,
                  fontSize: fontSize ?? 16,
                ),
              ),
            ),
          if (icon != null && iconSpace) const Spacer(),
          if (icon != null && iconSpace && !isEndIcon) Container(),
          if (icon != null && isEndIcon) icon!,
        ],
      ),
    );
  }
}