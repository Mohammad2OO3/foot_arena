import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../../common/design/design.dart';
import 'auth_bottom_text.dart';
import 'auth_button.dart';
import 'auth_segmented_tabs.dart';
import 'auth_text_field.dart';
import 'forgot_password_button.dart';

class AuthGlassCard extends StatelessWidget {
  const AuthGlassCard({
    super.key,
    required this.tabController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.obscurePassword,
    required this.obscureConfirmPassword,
    required this.onTogglePassword,
    required this.onToggleConfirmPassword,
    required this.onSubmit,
  });

  final TabController tabController;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  final bool obscurePassword;
  final bool obscureConfirmPassword;

  final VoidCallback onTogglePassword;
  final VoidCallback onToggleConfirmPassword;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            color: PColors.secondary.withOpacity(0.55),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: PColors.primary.withOpacity(0.12),
            ),
          ),
          child: Column(
            children: [
              AuthSegmentedTabs(
                tabController: tabController,
              ),

              const SizedBox(height: 28),

              AuthTextField(
                controller: emailController,
                hint: 'Email Address',
                icon: Icons.mail_outline_rounded,
              ),

              const SizedBox(height: 16),


              AuthTextField(
                controller: passwordController,
                hint: 'Password',
                icon: Icons.lock_outline_rounded,
                isPassword: true,
                obscure: obscurePassword,
                onToggleObscure: onTogglePassword,
              ),

              if (tabController.index == 1) ...[
                const SizedBox(height: 16),

                AuthTextField(
                  controller: confirmPasswordController,
                  hint: 'Confirm Password',
                  icon: Icons.lock_outline_rounded,
                  isPassword: true,
                  obscure: obscureConfirmPassword,
                  onToggleObscure:
                  onToggleConfirmPassword,
                ),
              ],

              const SizedBox(height: 12),

              if (tabController.index == 0)


                const ForgotPasswordButton(),

              const SizedBox(height: 20),
              AuthButton(
                label: tabController.index == 0
                    ? 'Login'
                    : 'Create Account',
                isLogin: tabController.index == 0,
                onPressed: onSubmit,
              ),

              const SizedBox(height: 24),

              AuthBottomText(
                isLoginTab:
                tabController.index == 0,
                onTap: () {
                  tabController.animateTo(
                    tabController.index == 0 ? 1 : 0,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}