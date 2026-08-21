import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "View All",
          style: TextStyle(
            color: Color(0xff00E676),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}