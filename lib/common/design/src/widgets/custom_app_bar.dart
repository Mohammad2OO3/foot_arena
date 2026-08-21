import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
    this.canPop = true,
  });
  final String title;
  final bool canPop;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.scaffoldBackgroundColor,
      surfaceTintColor: context.scaffoldBackgroundColor,
      centerTitle: true,
      title: Text(
        title,
        style: context.textTheme.titleLarge,
      ),
      leading: (canPop)
          ? IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back_ios_rounded),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
