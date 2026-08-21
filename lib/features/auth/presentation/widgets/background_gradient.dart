import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF0A0E27),
                  Color(0xFF0D1B2A),
                  Color(0xFF1B2838),
                ],
                stops: [0.0, 0.4, 0.9],
              ),
            ),
          ),
          Container(
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
        ],
      ),
    );
  }
}