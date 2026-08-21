import 'package:flutter/material.dart';

import '../../data/models/field_entity.dart';
import '../widgets/field_card.dart';
import '../widgets/section_header.dart';


class FavoritesSection extends StatelessWidget {
  const FavoritesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final fields = [
      const FieldEntity(
        image: "assets/images/jpg/field.jpg",
        title: "Arena Pro\nStadium",
        location: "Downtown",
        rating: 4.8,
        hourPrice: "\$50",
        halfPrice: "\$25",
      ),
      const FieldEntity(
        image: "assets/images/jpg/match.jpeg",
        title: "Green Valley Pitch",
        location: "West Side",
        rating: 4.6,
        hourPrice: "\$40",
        halfPrice: "\$20",
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: "Favorites"),
        const SizedBox(height: 15),

        SizedBox(
          height: 310,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: fields.length,
            separatorBuilder: (_, __) =>
            const SizedBox(width: 15),
            itemBuilder: (context, index) {
              return FieldCard(
                field: fields[index],
              );
            },
          ),
        ),
      ],
    );
  }
}