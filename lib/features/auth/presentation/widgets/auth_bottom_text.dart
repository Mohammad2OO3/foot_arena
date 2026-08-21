import 'package:flutter/material.dart';
import 'package:footarena/common/extensions/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/design/design.dart';

class AuthBottomText extends StatelessWidget {
  const AuthBottomText({
    super.key,
    required this.isLoginTab,
    required this.onTap,
  });

  final bool isLoginTab;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: [
        Text(
          isLoginTab
              ? "Don't have an account? "
              : 'Already have an account? ',
          style: GoogleFonts.tajawal(
            color: Colors.white.withOpacity(0.45),
            fontSize: 14,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            isLoginTab ? 'Sign Up' : 'Login',
            style: GoogleFonts.tajawal(
              color: context.primarySwatch,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}