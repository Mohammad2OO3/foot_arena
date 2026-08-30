import 'package:flutter/material.dart';

class BookingMatchTypeSelector extends StatelessWidget {
  final String selectedMatchType;
  final List<String> matchTypes;
  final ValueChanged<String?> onChanged;

  const BookingMatchTypeSelector({
    super.key,
    required this.selectedMatchType,
    required this.matchTypes,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.people_outline, color: Color(0xFF00E676), size: 20),
            SizedBox(width: 8),
            Text(
              'Match Type',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF111827),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedMatchType,
              dropdownColor: const Color(0xFF111827),
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white54),
              items: matchTypes.map((String type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(
                    type,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}