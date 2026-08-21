import 'package:flutter/material.dart';

import '../widgets/favorites_section.dart';
import '../widgets/header_section.dart';
import '../widgets/popular_matches_section.dart';
import '../widgets/recommended_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff070B13),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const HeaderSection(),

              const SizedBox(height: 40),

              const FavoritesSection(),

              const SizedBox(height: 30),

              const PopularMatchesSection(),

              const SizedBox(height: 30),

              const RecommendedSection(),
            ],
          ),
        ),
      ),
    );
  }
}