import 'package:flutter/material.dart';

import '../../data/models/field_entity.dart';

import '../widgets/field_card.dart';
import '../widgets/section_header.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    final fields = [
      const FieldEntity(
        image: "assets/images/jpg/field.jpg",
        title: "Elite Soccer Arena",
        location: "East End",
        rating: 4.5,
        hourPrice: "\$45",
        halfPrice: "\$22.5",
      ),
      const FieldEntity(
        image: "assets/images/jpg/field.jpg",
        title: "Pro Turf Stadium",
        location: "South Plaza",
        rating: 4.8,
        hourPrice: "\$65",
        halfPrice: "\$32.5",
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
          title: "Recommended for You",
        ),

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