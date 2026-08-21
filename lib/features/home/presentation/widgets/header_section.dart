import 'package:flutter/material.dart';

import 'search_bar_widget.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text(
          "Discover Fields",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 25),
        SearchBarWidget(),
      ],
    );
  }
}