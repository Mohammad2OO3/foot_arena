import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final bool enabled;
  final ValueChanged<String>? onChanged;

  const EditProfileInputField({
    super.key,
    required this.label,
    required this.controller,
    required this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.tajawal(
            color: Colors.white.withOpacity(0.75),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.06),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Colors.white.withOpacity(0.07),
            ),
          ),
          child: TextFormField(
            controller: controller,
            enabled: enabled,
            keyboardType: keyboardType,
            onChanged: onChanged,
            style: GoogleFonts.tajawal(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,

              prefixIcon: Icon(
                prefixIcon,
                color: Colors.white.withOpacity(0.35),
                size: 20,
              ),

              hintStyle: GoogleFonts.tajawal(
                color: Colors.white.withOpacity(0.25),
                fontSize: 15,
              ),

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}