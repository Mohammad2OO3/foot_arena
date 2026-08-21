import 'package:flutter/material.dart';

import '../../../../common/design/src/theme/colors.dart';

class AuthButton extends StatelessWidget {
  final String label;
  final bool isLogin;
  final VoidCallback onPressed;

  const AuthButton({
    super.key,
    required this.label,
    required this.isLogin,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,

      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: PColors.neonGreen,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(label),
      ),
    );
  }
}