import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../design.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    super.key,
    required this.title,
    required this.child,
    this.style,
    this.spaceWidget,
    this.withDot = false,
  });
  final String title;
  final bool withDot;
  final Widget child;
  final Widget? spaceWidget;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (withDot)
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(radius: 5),
                  Space.hS1,
                  Text(
                    title,
                    style: style ?? context.textTheme.titleMedium,
                  )
                ],
              )
            : Text(
                title,
                style: style ?? context.textTheme.titleMedium,
              ),
        spaceWidget ?? Container(),
        child,
        Space.vM1,
      ],
    );
  }
}
