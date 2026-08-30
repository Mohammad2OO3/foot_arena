import 'package:flutter/material.dart';

class PitchAmenitiesList extends StatelessWidget {
  const PitchAmenitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Amenities',
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [
              _AmenityItem(icon: Icons.lightbulb_outlined, label: 'Lights'),
              _AmenityItem(icon: Icons.shower_outlined, label: 'Locker Rooms'),
              _AmenityItem(icon: Icons.wc, label: 'Restrooms'),
              _AmenityItem(icon: Icons.directions_car_outlined, label: 'Parking'),
              _AmenityItem(icon: Icons.wb_sunny_outlined, label: 'Open'),
            ],
          ),
        ),
      ],
    );
  }
}

class _AmenityItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _AmenityItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFF062E1B),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(icon, color: const Color(0xFF00E676), size: 24),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
        ],
      ),
    );
  }
}