import 'package:flutter/material.dart';

import '../../../../common/design/design.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const RadialGradient(
          colors: [
            PColors.neonGreen,
            Color(0xFF00C853),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: PColors.neonGreen.withOpacity(0.25),
            blurRadius: 40,
            spreadRadius: 6,
          ),
        ],
      ),
      child: const Icon(
        Icons.sports_soccer,
        size: 48,
        color: Colors.white,
      ),
    );
  }
}