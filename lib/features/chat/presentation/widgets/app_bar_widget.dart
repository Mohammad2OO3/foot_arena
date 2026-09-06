import 'package:flutter/material.dart';
import '../../../../common/extensions/src/context_extensions.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.primarySwatch,
      shadowColor: Colors.transparent,
      scrolledUnderElevation: 0,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          color:Colors.white,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [


          Expanded(
            child: Text(
            'Ai Chat',
              style: context.headlineSmall(
                fontSize: 22,
                color:Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
