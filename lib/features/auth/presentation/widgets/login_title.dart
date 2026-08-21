import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'FOOT ARENA',
          style: GoogleFonts.tajawal(
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Your Ultimate Football Platform',
          style: GoogleFonts.tajawal(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.8),
            letterSpacing: 2.4,
          ),
        ),
      ],
    );
  }
}