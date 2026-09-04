import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        Text(
          'Position',
          style: GoogleFonts.tajawal(
            color: Colors.white.withOpacity(0.75),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(0.07),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedPosition,
              isExpanded: true,
              dropdownColor: const Color(0xFF1E293B),
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.white.withOpacity(0.35),
              ),
              items: positions.map((String position) {
                return DropdownMenuItem<String>(
                  value: position,
                  child: Row(
                    children: [
                      Icon(
                        Icons.sports_soccer,
                        size: 20,
                        color: Colors.white.withOpacity(0.35),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        position,
                        style: GoogleFonts.tajawal(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
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