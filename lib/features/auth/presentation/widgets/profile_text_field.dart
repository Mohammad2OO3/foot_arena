import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType? keyInputType;
  final String? Function(String? text)? validator;


  const ProfileTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
     this.validator,
     this.keyInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.07),
        ),
      ),
      child: TextFormField(
        validator:validator,
        controller: controller,
        keyboardType: keyInputType,
        style: GoogleFonts.tajawal(color: Colors.white),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(icon,
              color: Colors.white.withOpacity(0.4)),
          hintText: hint,
          hintStyle: TextStyle(
              color: Colors.white.withOpacity(0.3)),
          contentPadding: const EdgeInsets.all(16),
        ),
      ),
    );
  }
}