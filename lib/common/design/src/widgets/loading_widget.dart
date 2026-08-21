import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 225,
        child: Stack(
          alignment: Alignment.center,
          children: [CircularProgressIndicator()],
        ),
      ),
    );
  }
}
