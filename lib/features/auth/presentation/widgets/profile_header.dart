import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final Widget child;

  const ProfileHeader({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0A0E27),
                  Color(0xFF0D1B2A),
                  Color(0xFF1B2838),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topCenter,
                radius: 1.4,
                colors: [
                  Colors.white.withOpacity(0.02),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        SafeArea(child: child),
      ],
    );
  }
}