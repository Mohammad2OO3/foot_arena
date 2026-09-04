import 'package:flutter/material.dart';

class EditProfilePositionDropdown extends StatelessWidget {
  final String selectedPosition;
  final List<String> positions;
  final ValueChanged<String?> onChanged;

  const EditProfilePositionDropdown({
    super.key,
    required this.selectedPosition,
    required this.positions,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Position',
          style: TextStyle(
            color: Color(0xFF2E3E5C),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFFE2E8F0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedPosition,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF94A3B8)),
              items: positions.map((String position) {
                return DropdownMenuItem<String>(
                  value: position,
                  child: Row(
                    children: [
                      const Icon(Icons.sports_soccer, size: 20, color: Color(0xFF3B82F6)),
                      const SizedBox(width: 8),
                      const Icon(Icons.ads_click, size: 18, color: Color(0xFFEC4899)),
                      const SizedBox(width: 10),
                      Text(
                        position,
                        style: const TextStyle(
                          color: Color(0xFF1E293B),
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
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