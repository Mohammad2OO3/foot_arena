import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/common/extensions/extensions.dart';
import 'package:footarena/common/models/user_model.dart';
import 'package:footarena/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:footarena/features/profile/presentation/bloc/profile_event.dart';
import '../../domain/use_cases/edit_profile_data_use_case.dart';
import '../bloc/profile_state.dart';
import '../widgets/edit_profile/edit_profile_input_field.dart';
import '../widgets/edit_profile/edit_profile_position_dropdown.dart';
import '../widgets/edit_profile/section_header.dart';

class EditProfilePage extends StatefulWidget {
  final EditProfilePageParams args;

  const EditProfilePage({super.key, required this.args});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // ---------------------------------------------------------------------------
  // Controllers
  // ---------------------------------------------------------------------------

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController phoneController;
  late final TextEditingController ageController;
  late final TextEditingController heightController;
  late final TextEditingController weightController;
  late final TextEditingController experienceController;

  // ---------------------------------------------------------------------------
  // Other State
  // ---------------------------------------------------------------------------

  late String selectedPosition;
  late ProfileBloc profileBloc;

  final List<String> positions = [
    'Striker',
    'Midfielder',
    'Defender',
    'Goalkeeper',
    'Winger',
  ];

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();
    profileBloc = widget.args.profileBloc;

    final user = widget.args.userModel;

    firstNameController = TextEditingController(text: user.firstName ?? '');

    lastNameController = TextEditingController(text: user.lastName ?? '');

    emailController = TextEditingController(text: user.email ?? '');

    phoneController = TextEditingController(text: user.phone ?? '');

    ageController = TextEditingController(text: user.age?.toString() ?? '');

    heightController = TextEditingController(
      text: user.height?.toString() ?? '',
    );

    weightController = TextEditingController(
      text: user.weight?.toString() ?? '',
    );

    experienceController = TextEditingController(
      text: user.experienceYears?.toString() ?? '',
    );

    selectedPosition = user.position ?? 'Midfielder';
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    ageController.dispose();
    heightController.dispose();
    weightController.dispose();
    experienceController.dispose();

    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ProfileBloc, ProfileState>(
        bloc: profileBloc,
        listener: (context, state) {
          state.editProfileData.listenerFunction(
            onSuccess: () {
              context.pop();
            },
          );
        },
        child: Column(
          children: [
            Container(
              color: context.primarySwatch,
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
                    onPressed: _onSave,
                    icon: const Icon(
                      Icons.check,
                      size: 18,
                      color: Color(0xFF1B5E20),
                    ),
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
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // -----------------------------------------------------------
                    // Avatar
                    // -----------------------------------------------------------
                    const SizedBox(height: 12),

                    // -----------------------------------------------------------
                    // Personal Info
                    // -----------------------------------------------------------
                    const SectionHeader(title: 'PERSONAL INFO'),

                    Row(
                      children: [
                        Expanded(
                          child: EditProfileInputField(
                            label: 'First Name',
                            controller: firstNameController,
                            prefixIcon: Icons.person_outline,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: EditProfileInputField(
                            label: 'Last Name',
                            controller: lastNameController,
                            prefixIcon: Icons.person_outline,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),

                    EditProfileInputField(
                      label: 'Email',
                      controller: emailController,
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 16),

                    EditProfileInputField(
                      label: 'Phone',
                      controller: phoneController,
                      prefixIcon: Icons.phone_outlined,
                      keyboardType: TextInputType.phone,
                    ),

                    // -----------------------------------------------------------
                    // Physical Stats
                    // -----------------------------------------------------------
                    const SectionHeader(title: 'PHYSICAL STATS'),

                    Row(
                      children: [
                        Expanded(
                          child: EditProfileInputField(
                            label: 'Age',
                            controller: ageController,
                            prefixIcon: Icons.calendar_today_outlined,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: EditProfileInputField(
                            label: 'Height (cm)',
                            controller: heightController,
                            prefixIcon: Icons.straighten,
                            keyboardType: TextInputType.number,
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
                            controller: weightController,
                            prefixIcon: Icons.fitness_center,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: EditProfileInputField(
                            label: 'Experience (yrs)',
                            controller: experienceController,
                            prefixIcon: Icons.emoji_events_outlined,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),

                    // -----------------------------------------------------------
                    // Football Profile
                    // -----------------------------------------------------------
                    const SectionHeader(title: 'FOOTBALL PROFILE'),

                    EditProfilePositionDropdown(
                      selectedPosition: selectedPosition,
                      positions: positions,
                      onChanged: (value) {
                        if (value == null) return;

                        setState(() {
                          selectedPosition = value;
                        });
                      },
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  void _onSave() {
    final firstName = firstNameController.text.trim();
    final lastName = lastNameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final age = ageController.text.trim();
    final height = heightController.text.trim();
    final weight = weightController.text.trim();
    final experience = experienceController.text.trim();

    profileBloc.add(
      EditProfileEvent(
        params: EditProfileDataParams(
          email: email,
          height:int.tryParse(height) ,
          age: int.tryParse(age),
          experienceYears:  int.tryParse(experience) ,
          firstName: firstName,
          lastName: lastName,
          phone: phone,
          position: selectedPosition,
          weight:  int.tryParse(weight),
        ),
      ),
    );

  }
}

// -----------------------------------------------------------------------------
// Page Params
// -----------------------------------------------------------------------------

class EditProfilePageParams {
  final UserModel userModel;
  final ProfileBloc profileBloc;

  EditProfilePageParams({required this.userModel, required this.profileBloc});
}
