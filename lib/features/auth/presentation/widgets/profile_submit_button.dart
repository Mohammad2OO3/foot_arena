import 'package:flutter/material.dart';
import 'package:footarena/common/extensions/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/design/design.dart';

class ProfileSubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ProfileSubmitButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient:  LinearGradient(
          colors: [
            context.primarySwatch,
            Color(0xFF00C853),
          ],
        ),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          'Continue',
          style: GoogleFonts.tajawal(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}