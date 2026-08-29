import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';
import '../widgets/profile_header_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) => getIt<ProfileBloc>()..add(GetProfileEvent()),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return state.getProfileData.builder(
              onSuccess: (_) {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // الجزء الأعلى (الهيدر + الصور + الإحصائيات)
                      ProfileHeaderWidget(
                        profile: state.getProfileData.data!.data!,
                      ),
                      const SizedBox(height: 24),

                      // قسم المباريات (My Matches)
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 16),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       const Text(
                      //         "My Matches",
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //       const SizedBox(height: 12),
                      //       ...state.matches.map(
                      //         (match) => MatchCardWidget(match: match),
                      //       ),
                      //
                      //       const SizedBox(height: 24),
                      //
                      //       // قسم الفرق (My Teams)
                      //       const Text(
                      //         "My Teams",
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontSize: 20,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //       const SizedBox(height: 12),
                      //       ...state.teams.map(
                      //         (team) => TeamCardWidget(team: team),
                      //       ),
                      //
                      //       const SizedBox(height: 24),
                      //
                      //       // زر تسجيل الخروج (Logout)
                      //       SizedBox(
                      //         width: double.infinity,
                      //         height: 52,
                      //         child: ElevatedButton(
                      //           onPressed: () {
                      //             // أضف event الخروج الخاص بالـ Bloc هنا
                      //           },
                      //           style: ElevatedButton.styleFrom(
                      //             backgroundColor: const Color(0xFF3E1014),
                      //             shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(16),
                      //             ),
                      //           ),
                      //           child: const Row(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Icon(Icons.logout, color: Colors.redAccent),
                      //               SizedBox(width: 8),
                      //               Text(
                      //                 "Logout",
                      //                 style: TextStyle(
                      //                   color: Colors.redAccent,
                      //                   fontSize: 16,
                      //                   fontWeight: FontWeight.bold,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //       const SizedBox(height: 32),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                );
              },
              failedWidget: Center(
                child: Text(
                  state.getProfileData.errorMessage,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
