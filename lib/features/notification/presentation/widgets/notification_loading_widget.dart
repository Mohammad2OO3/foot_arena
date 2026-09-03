
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../common/design/src/widgets/shimmer_widget.dart';
import '../../../../common/extensions/src/context_extensions.dart';

class NotificationLoadingWidget extends StatelessWidget {
  const NotificationLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 375),
          child: ScaleAnimation(
            child: FadeInAnimation(
              child: NotificationLoadingElement(),
            ),
          ),
        );
      },
    );
  }
}

class NotificationLoadingElement extends StatelessWidget {
  const NotificationLoadingElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            ShimmerWidget(
              width: 45,
              height: 45,
              shape: BoxShape.circle,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ShimmerWidget(
                    width: context.width * .8,
                    height: 18,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  SizedBox(height: 4),
                  ShimmerWidget(
                    width: context.width * .3,
                    height: 16,
                    borderRadius: BorderRadius.circular(16),

                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 1,

          margin: EdgeInsets.symmetric(vertical: 24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                context.grey.withOpacity(0),
                context.grey.withOpacity(.5),
                context.grey.withOpacity(0),
              ],
              begin: AlignmentDirectional.centerStart,
              end: AlignmentDirectional.centerEnd,
            ),
          ),
        ),
      ],
    );
  }
}
