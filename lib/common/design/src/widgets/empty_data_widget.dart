import 'package:flutter/material.dart';
import 'package:footarena/common/design/src/widgets/svg_asset.dart';
import '../../../extensions/src/context_extensions.dart';
import '../../../helper/src/locale_keys.dart';
import '../theme/assets.gen.dart';
import '../theme/const.dart';

class EmptyDataWidget extends StatelessWidget {
  final String? image;
  final double? height;

  const EmptyDataWidget({super.key, this.image, this.height});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image ?? Assets.images.png.error.emptyCleaningImage.keyName,
            height: height ?? context.height * .4,
          ),
          SizedBox(height: 24),
          Text(
            LocaleKeys.errorMassegeNocontent.tr(),
            style: context.labelSmall(
              color: Colors.black,
              fontSize: 24,
              fontFamily: "Nasaq",
            ),
            textAlign: TextAlign.center,

          ),
          Space.vM1,
        ],
      ),
    );
  }
}

class EmptyMessagesDataWidget extends StatelessWidget {
  const EmptyMessagesDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgAsset(
            Assets.images.svg.emptyMessages,
            height: context.height * .4,
          ),
          Text(
            LocaleKeys.errorMassegeNocontent.tr(),
            style: context.titleLarge(),
          ),
          Space.vM1,
        ],
      ),
    );
  }
}

class EmptyDataSubWidget extends StatelessWidget {
  final String? image;
  final double? height;
  final String title;
  final String subTitle;

  const EmptyDataSubWidget({
    super.key,
    this.image,
    this.height,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image ?? Assets.images.png.error.emptyCleaningImage.keyName,
            height: height ?? context.height * .4,
          ),
          SizedBox(height: 24),
          Text(
           title,
            style: context.labelSmall(fontSize: 24, fontFamily: "Nasaq"),
            textAlign: TextAlign.center,

          ),
          Space.vM1,
          Text(
            subTitle,
            style: context.bodySmall(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
