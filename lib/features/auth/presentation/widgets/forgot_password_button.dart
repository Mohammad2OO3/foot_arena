import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/design/design.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Forgot Password?',
          style: GoogleFonts.tajawal(
            color: PColors.neonGreen,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}