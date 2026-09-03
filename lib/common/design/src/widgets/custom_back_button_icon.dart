import 'package:flutter/material.dart';
import 'package:footarena/common/design/src/widgets/svg_asset.dart';

import '../../../extensions/src/context_extensions.dart';
import '../../../helper/helper.dart';
import '../theme/assets.gen.dart';

class CustomBackButtonIcon extends StatelessWidget {
  final bool withShadow;

  const CustomBackButtonIcon({super.key, this.withShadow = false});

  @override
  Widget build(BuildContext context) {
    final bool isArabic = context.locale.languageCode == 'ar';

    return Align(
      alignment: AlignmentDirectional.topStart,
      child: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: Container(
          padding: EdgeInsets.all(10),

          decoration: BoxDecoration(
            border: Border.all(color: context.textFieldBorderColor),
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: withShadow
                ? [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, .2),
                offset: Offset(0, 2),
                blurRadius: 4,
                spreadRadius: 0,
              ),
            ]
                : null,
          ),
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()..scale(isArabic ? -1.0 : 1.0, 1.0),
            child: Icon(Icons.arrow_back_ios_new_outlined),
          ),
        ),
      ),
    );
  }
}
