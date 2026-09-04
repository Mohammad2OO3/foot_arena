import 'package:flutter/material.dart';
import '../widgets/edit_profile/edit_profile_avatar.dart';
import '../widgets/edit_profile/edit_profile_input_field.dart';
import '../widgets/edit_profile/edit_profile_position_dropdown.dart';
import '../widgets/edit_profile/section_header.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // Form State
  String firstName = 'Alex';
  String lastName = 'Morgan';
  String email = 'alex.morgan@email.com';
  String phone = '+1 555 0142';
  String age = '26';
  String height = '181';
  String weight = '76';
  String experience = '8';
  String selectedPosition = 'Midfielder';

  final List<String> positions = ['Goalkeeper', 'Defender', 'Midfielder', 'Forward'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Stack(
        children: [
          // Header Background (Green Banner)
          Container(
            height: 160,
            color: const Color(0xFF1B5E20),
            padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white24,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                const Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Save action
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.check, size: 18, color: Color(0xFF1B5E20)),
                  label: const Text(
                    'Save',
                    style: TextStyle(
                      color: Color(0xFF1B5E20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ],
            ),
          ),

          // Main Form
          Positioned.fill(
            top: 100,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Avatar Section
                  EditProfileAvatar(
                    onChangePhoto: () {
                      // Handle Image Picker
                    },
                  ),
                  const SizedBox(height: 12),

                  // Personal Info Section
                  const SectionHeader(title: 'PERSONAL INFO'),
                  Row(
                    children: [
                      Expanded(
                        child: EditProfileInputField(
                          label: 'First Name',
                          initialValue: firstName,
                          prefixIcon: Icons.person_outline,
                          onChanged: (val) => firstName = val,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: EditProfileInputField(
                          label: 'Last Name',
                          initialValue: lastName,
                          prefixIcon: Icons.person_outline,
                          onChanged: (val) => lastName = val,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  EditProfileInputField(
                    label: 'Email',
                    initialValue: email,
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (val) => email = val,
                  ),
                  const SizedBox(height: 16),
                  EditProfileInputField(
                    label: 'Phone',
                    initialValue: phone,
                    prefixIcon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                    onChanged: (val) => phone = val,
                  ),

                  // Physical Stats Section
                  const SectionHeader(title: 'PHYSICAL STATS'),
                  Row(
                    children: [
                      Expanded(
                        child: EditProfileInputField(
                          label: 'Age',
                          initialValue: age,
                          prefixIcon: Icons.calendar_today_outlined,
                          keyboardType: TextInputType.number,
                          onChanged: (val) => age = val,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: EditProfileInputField(
                          label: 'Height (cm)',
                          initialValue: height,
                          prefixIcon: Icons.straighten,
                          keyboardType: TextInputType.number,
                          onChanged: (val) => height = val,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: EditProfileInputField(
                          label: 'Weight (kg)',
                          initialValue: weight,
                          prefixIcon: Icons.fitness_center,
                          keyboardType: TextInputType.number,
                          onChanged: (val) => weight = val,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: EditProfileInputField(
                          label: 'Experience (yrs)',
                          initialValue: experience,
                          prefixIcon: Icons.emoji_events_outlined,
                          keyboardType: TextInputType.number,
                          onChanged: (val) => experience = val,
                        ),
                      ),
                    ],
                  ),

                  // Football Profile Section
                  const SectionHeader(title: 'FOOTBALL PROFILE'),
                  EditProfilePositionDropdown(
                    selectedPosition: selectedPosition,
                    positions: positions,
                    onChanged: (val) {
                      if (val != null) {
                        setState(() => selectedPosition = val);
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}