import 'package:flutter/material.dart';
import 'package:footarena/common/extensions/extensions.dart';
import 'package:google_fonts/google_fonts.dart';


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
            color: context.primarySwatch,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}