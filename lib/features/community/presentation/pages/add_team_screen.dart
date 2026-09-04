import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/common/extensions/extensions.dart';
import 'package:footarena/features/community/presentation/bloc/community_bloc.dart';

import '../../domin/use_cases/add_team_use_case.dart';

class AddTeamScreen extends StatefulWidget {
  final AddTeamScreenParams args;

  const AddTeamScreen({
    super.key,
    required this.args,
  });

  @override
  State<AddTeamScreen> createState() => _AddTeamScreenState();
}

class _AddTeamScreenState extends State<AddTeamScreen> {
  // ---------------------------------------------------------------------------
  // Controllers
  // ---------------------------------------------------------------------------

  late final TextEditingController teamNameController;
  late final TextEditingController descriptionController;

  // ---------------------------------------------------------------------------
  // Bloc
  // ---------------------------------------------------------------------------

  late final CommunityBloc communityBloc;

  // ---------------------------------------------------------------------------
  // Lifecycle
  // ---------------------------------------------------------------------------

  @override
  void initState() {
    super.initState();

    communityBloc = widget.args.communityBloc;

    teamNameController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    teamNameController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<CommunityBloc, CommunityState>(
        bloc: communityBloc,
        listener: (context, state) {
          state.addTeamData.listenerFunction(
            onSuccess: () {
              context.pop();
            },
          );
        },
        child: Column(
          children: [
            // -----------------------------------------------------------------
            // Header
            // -----------------------------------------------------------------

            Container(
              width: double.infinity,
              color: context.primarySwatch,
              padding: const EdgeInsets.only(
                top: 40,
                left: 16,
                right: 16,
                bottom: 20,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () => context.pop(),
                    ),
                  ),

                  const SizedBox(width: 16),

                  const Text(
                    'Add Team',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // -----------------------------------------------------------------
            // Form
            // -----------------------------------------------------------------

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ---------------------------------------------------------
                    // Intro
                    // ---------------------------------------------------------

                    const Text(
                      'Create your team',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      'Add your team information to get started.',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.55),
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ---------------------------------------------------------
                    // Team Name
                    // ---------------------------------------------------------

                    _buildLabel('Team Name'),

                    const SizedBox(height: 8),

                    _buildTextField(
                      controller: teamNameController,
                      hint: 'Enter team name',
                      icon: Icons.groups_rounded,
                      keyboardType: TextInputType.text,
                    ),

                    const SizedBox(height: 20),

                    // ---------------------------------------------------------
                    // Description
                    // ---------------------------------------------------------

                    _buildLabel('Team Description'),

                    const SizedBox(height: 8),

                    _buildTextField(
                      controller: descriptionController,
                      hint: 'Tell us something about your team...',
                      icon: Icons.description_outlined,
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      minLines: 5,
                    ),

                    const SizedBox(height: 32),

                    // ---------------------------------------------------------
                    // Create Button
                    // ---------------------------------------------------------

                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: _onCreateTeam,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: context.primarySwatch,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_circle_outline_rounded,
                              size: 21,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Create Team',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
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
  // Widgets
  // ---------------------------------------------------------------------------

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white.withOpacity(0.75),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    required TextInputType keyboardType,
    int maxLines = 1,
    int? minLines,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white.withOpacity(0.07),
        ),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        minLines: minLines,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,

          prefixIcon: Padding(
            padding: EdgeInsets.only(
              bottom: maxLines > 1 ? 70 : 0,
            ),
            child: Icon(
              icon,
              color: Colors.white.withOpacity(0.35),
              size: 20,
            ),
          ),

          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.25),
            fontSize: 15,
          ),

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 14,
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // Actions
  // ---------------------------------------------------------------------------

  void _onCreateTeam() {
    final teamName = teamNameController.text.trim();
    final description = descriptionController.text.trim();

    if (teamName.isEmpty || description.isEmpty) {
      return;
    }

    communityBloc.add(
      AddTeamEvent(
        params: AddTeamParams(
          name: teamName,
          description: description,
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// Page Params
// -----------------------------------------------------------------------------

class AddTeamScreenParams {
  final CommunityBloc communityBloc;

  AddTeamScreenParams({
    required this.communityBloc,
  });
}