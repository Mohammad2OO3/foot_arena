import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/design/design.dart';
import '../../../home/presentation/pages/home_screen.dart';
import 'profile_text_field.dart';
import 'profile_dropdown.dart';
import 'profile_submit_button.dart';

class ProfileGlassCard extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController phoneController;
  final TextEditingController ageController;
  final TextEditingController heightController;
  final TextEditingController weightController;
  final TextEditingController yearsPlayedController;
  final TextEditingController ratingController;

  final String position;
  final List<String> positions;
  final Function(String) onPositionChanged;

  const ProfileGlassCard({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.phoneController,
    required this.ageController,
    required this.heightController,
    required this.weightController,
    required this.yearsPlayedController,
    required this.ratingController,
    required this.position,
    required this.positions,
    required this.onPositionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: PColors.secondary.withOpacity(0.55),
              borderRadius: BorderRadius.circular(28),
              border: Border.all(
                color: PColors.primary.withOpacity(0.12),
              ),
            ),
            child: Column(
              children: [
                _title(),

                const SizedBox(height: 50),

                ProfileTextField(
                  controller: firstNameController,
                  hint: 'First Name',
                  icon: Icons.person,
                ),

                ProfileTextField(
                  controller: lastNameController,
                  hint: 'Last Name',
                  icon: Icons.person_outline,
                ),

                ProfileTextField(
                  controller: phoneController,
                  hint: 'Phone',
                  icon: Icons.phone,
                ),

                Row(
                  children: [
                    Expanded(
                      child: ProfileTextField(
                        controller: ageController,
                        hint: 'Age',
                        icon: Icons.cake,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ProfileTextField(
                        controller: heightController,
                        hint: 'Height',
                        icon: Icons.height,
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: ProfileTextField(
                        controller: weightController,
                        hint: 'Weight',
                        icon: Icons.monitor_weight,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ProfileTextField(
                        controller: yearsPlayedController,
                        hint: 'Years',
                        icon: Icons.sports_soccer,
                      ),
                    ),
                  ],
                ),

                ProfileDropdown(
                  value: position,
                  items: positions,
                  onChanged: onPositionChanged,
                ),

                ProfileTextField(
                  controller: ratingController,
                  hint: 'Rating',
                  icon: Icons.star,
                ),

                const SizedBox(height: 50),

                ProfileSubmitButton(
                  onPressed: () {
                    final isValid = _validate(context);

                    if (!isValid) return;

                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const HomeScreen(),
                      ),
                          (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _validate(BuildContext context) {
    if (firstNameController.text.trim().isEmpty ||
        lastNameController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty ||
        ageController.text.trim().isEmpty ||
        heightController.text.trim().isEmpty ||
        weightController.text.trim().isEmpty ||
        yearsPlayedController.text.trim().isEmpty ||
        ratingController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }

    return true;
  }

  Widget _title() {
    return Column(
      children: [
        Text(
          'Complete Profile',
          style: GoogleFonts.tajawal(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'Fill your football data',
          style: GoogleFonts.tajawal(
            color: Colors.white.withOpacity(0.5),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}