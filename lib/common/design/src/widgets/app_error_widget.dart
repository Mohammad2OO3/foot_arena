import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../../helper/src/locale_keys.dart';


class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onTap,
  });

  final String errorMessage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * .05),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Assets.images.png.error.emptyCleaningImage.image(),
            const SizedBox(height: 24),
            Text(
              LocaleKeys.errorLoadFailed.tr(),
              style: context.labelSmall(fontSize: 24, fontFamily: "Nasaq"),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage,
              style: context.bodySmall(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class AppErrorWidgetReFresh extends StatelessWidget {
  const AppErrorWidgetReFresh({
    super.key,
    required this.errorMessage,
    required this.onTap,
  });

  final String errorMessage;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        onTap();
      },
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * .05),
              child: GestureDetector(
                onTap: onTap,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Assets.images.png.error.emptyCleaningImage.image(),
                    const SizedBox(height: 24),
                    Text(
                      LocaleKeys.errorLoadFailed.tr(),
                      style: context.labelSmall(
                        fontSize: 24,
                        fontFamily: "Nasaq",
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      errorMessage,
                      style: context.bodySmall(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class AppErrorWidgetNullReFresh extends StatelessWidget {
  const AppErrorWidgetNullReFresh({
    super.key,
    required this.errorMessage,
    required this.errorSubMessage,
    required this.onTap,
    this.image

  });

  final String errorMessage;
  final String errorSubMessage;
  final String? image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        onTap();
      },
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.width * .05),
              child: GestureDetector(
                onTap: onTap,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  // image==null?Assets.images.png.error.emptyMyCars.image(
                  //   width: context.width*.63
                  // )  :Image.asset(image!,
                  //     width: context.width*.63),
                    const SizedBox(height: 24),
                    Text(
                      errorMessage,
                      style: context.labelSmall(
                        fontSize: 24,
                        fontFamily: "Nasaq",
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      errorSubMessage,
                      style: context.bodySmall(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
