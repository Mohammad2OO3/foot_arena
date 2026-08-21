import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.obscure = false,
    this.onToggleObscure,
  });

  final TextEditingController controller;
  final String hint;
  final IconData icon;

  final bool isPassword;
  final bool obscure;

  final VoidCallback? onToggleObscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.07),
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? obscure : false,
        style: GoogleFonts.tajawal(
          color: Colors.white,
          fontSize: 15,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(0.35),
          ),
          suffixIcon: isPassword
              ? IconButton(
            onPressed: onToggleObscure,
            icon: Icon(
              obscure
                  ? Icons.visibility_off_rounded
                  : Icons.visibility_rounded,
              color: Colors.white.withOpacity(0.35),
            ),
          )
              : null,
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.25),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
        ),
      ),
    );
  }
}