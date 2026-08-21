import 'package:flutter/material.dart';

import '../../data/models/match_entity.dart';

import '../widgets/match_card.dart';
import '../widgets/section_header.dart';

class PopularMatchesSection extends StatelessWidget {
  const PopularMatchesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final matches = [
      const MatchEntity(
        image: "assets/images/jpg/field.jpg",
        title: "Victory Ground",
        location: "City Center",
        date: "Tonight 8PM",
        rating: 4.9,
      ),
      const MatchEntity(
        image: "assets/images/jpg/match.jpeg",
        title: "Champions Field",
        location: "North District",
        date: "Tomorrow 6PM",
        rating: 4.7,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: "Popular Matches Today",
        ),

        const SizedBox(height: 15),

        ListView.separated(
          shrinkWrap: true,
          physics:
          const NeverScrollableScrollPhysics(),
          itemCount: matches.length,
          separatorBuilder: (_, __) =>
          const SizedBox(height: 15),
          itemBuilder: (context, index) {
            return MatchCard(
              match: matches[index],
            );
          },
        ),
      ],
    );
  }
}