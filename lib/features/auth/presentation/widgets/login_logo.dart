import 'package:flutter/material.dart';
import 'package:footarena/common/extensions/extensions.dart';


class LoginLogo extends StatelessWidget {
  const LoginLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient:  RadialGradient(
          colors: [
            context.primarySwatch,
            Color(0xFF00C853),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: context.primarySwatch.withOpacity(0.25),
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