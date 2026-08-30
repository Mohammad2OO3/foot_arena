import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/features/community/presentation/bloc/community_bloc.dart';
import '../../../../common/extensions/src/context_extensions.dart';
import '../../../../core/di/injection.dart';
import '../../../../router/app_router.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';
import '../widgets/log_out_button.dart';
import '../widgets/profile_header_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final AuthBloc authBloc;
  late final CommunityBloc communityBloc;

  @override
  void initState() {
    authBloc = getIt<AuthBloc>();
    communityBloc = getIt<CommunityBloc>()
      ..add(GetMyTeamEvent());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) =>
      getIt<ProfileBloc>()
        ..add(GetProfileEvent()),
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

                      BlocBuilder<CommunityBloc, CommunityState>(
                        bloc: communityBloc,
                        builder: (context, state) {
                          return state.getMyTeamData.builder(
                              onSuccess: (data){
                            return TeamInfoCard(
                              teamName: data?.data?.name??'Team name',
                              role: data?.data?.pendingJoinRequestsCount??'Role',
                              members:data?.data?.membersCount??0,
                              wins: 0,
                              rating: 0,
                            );
                          },
                              onTapRetry: ()=>communityBloc.add(GetMyTeamEvent()),
                            failedWidget: SizedBox(),
                            loadingWidget: SizedBox(),
                          );
                        },
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
                      LogOutButton(authBloc: authBloc),
                      const SizedBox(height: 32),
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

class TeamInfoCard extends StatelessWidget {
  const TeamInfoCard({
    super.key,
    required this.teamName,
    required this.role,
    required this.members,
    required this.wins,
    required this.rating,
    this.isActive = true,
    this.icon = Icons.flash_on,
  });

  final String teamName;
  final String role;
  final int members;
  final int wins;
  final double rating;
  final bool isActive;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,

      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0E172C),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF24324B)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF00B85C),
                ),
                child: Icon(icon, size: 48, color: Colors.orange),
              ),

              const SizedBox(width: 22),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      teamName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      role,
                      style: const TextStyle(
                        color: Color(0xFF9AA9C2),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 12),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(0xFF063F35)
                      : const Color(0xFF3A2630),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  isActive ? 'Active' : 'Inactive',
                  style: TextStyle(
                    color: isActive
                        ? const Color(0xFF00D46A)
                        : Colors.redAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: _StatItem(title: 'Members', value: members.toString()),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: _StatItem(
                  title: 'Wins',
                  value: wins.toString(),
                  valueColor: const Color(0xFF00D46A),
                ),
              ),

              const SizedBox(width: 14),

              Expanded(
                child: _StatItem(
                  title: 'Rating',
                  value: rating.toStringAsFixed(1),
                  valueColor: const Color(0xFFFFB800),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.title,
    required this.value,
    this.valueColor = Colors.white,
  });

  final String title;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      decoration: BoxDecoration(
        color: const Color(0xFF1C2A42),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: Color(0xFF9AA9C2), fontSize: 20),
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
