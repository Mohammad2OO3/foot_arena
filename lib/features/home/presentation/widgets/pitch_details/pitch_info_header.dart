import 'package:flutter/material.dart';
import 'package:footarena/common/models/field_model.dart';
import 'package:footarena/features/home/presentation/pages/home_screen.dart';

class PitchInfoHeader extends StatelessWidget {
  final FieldModel fieldModel;

  const PitchInfoHeader({super.key, required this.fieldModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldModel.name ?? "Field Name",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            // const Icon(Icons.star, color: Colors.amber, size: 18),
            // const SizedBox(width: 4),
            // Text(
            //   pitch.rating.toString(),
            //   style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            // ),
            // const SizedBox(width: 16),
            const Icon(
              Icons.location_on_outlined,
              color: Color(0xFF00E676),
              size: 18,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                fieldModel.location ?? 'Location',
                style: const TextStyle(color: Colors.white60, fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Text(
          'Description',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          fieldModel.description ??
              'Beautiful outdoor pitch surrounded by nature, perfect for weekend matches.',
          style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.4),
        ),
      ],
    );
  }
}
