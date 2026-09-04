import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/features/community/presentation/bloc/community_bloc.dart';
import 'package:footarena/features/community/presentation/pages/add_team_screen.dart';
import 'package:footarena/features/community/presentation/pages/team_details_page.dart';
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
  late final ProfileBloc profileBloc;

  @override
  void initState() {
    authBloc = getIt<AuthBloc>();
    communityBloc = getIt<CommunityBloc>()
      ..add(GetMyTeamEvent());
    profileBloc=getIt<ProfileBloc>()..add(GetProfileEvent());

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileBloc>(
      create: (context) =>
      profileBloc,
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
                        profileBloc: profileBloc,

                      ),
                      // const SizedBox(height: 24),
                      //
                      // BlocBuilder<CommunityBloc, CommunityState>(
                      //   bloc: communityBloc,
                      //   builder: (context, state) {
                      //     return state.getMyTeamData.builder(
                      //       onSuccess: (data){
                      //         return TeamInfoCard(
                      //           teamName: data?.data?.name??'Team name',
                      //           role: data?.data?.pendingJoinRequestsCount??'Role',
                      //           members:data?.data?.membersCount??0,
                      //           wins: 0,
                      //           rating: 0,
                      //         );
                      //       },
                      //       onTapRetry: ()=>communityBloc.add(GetMyTeamEvent()),
                      //       failedWidget: SizedBox(),
                      //       loadingWidget: SizedBox(),
                      //     );
                      //   },
                      // ),
                      const SizedBox(height: 24),

                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            context.pushNamed(RouteName.teamDetails,arguments: TeamDetailsPageParams());

                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF111827),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide(
                                color: context.primarySwatch,
                              ),
                            ),
                          ),
                          child:  Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.people_alt_outlined, color: context.primarySwatch),
                              SizedBox(width: 8),
                              Text(
                                "My Team",
                                style: context.headlineMedium(color: context.primarySwatch),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          context.pushNamed(RouteName.addTeamScreen,arguments: AddTeamScreenParams(communityBloc: communityBloc));

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF111827),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: context.primarySwatch,
                            ),
                          ),
                        ),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add, color: context.primarySwatch),
                            SizedBox(width: 8),
                            Text(
                              "Create Team",
                              style: context.headlineMedium(color: context.primarySwatch),
                            ),
                          ],
                        ),
                      ),
                    ),
                      const SizedBox(height: 12),


                      LogOutButton(authBloc: authBloc),
                      const SizedBox(height: 32),
                    ],
                  ),
                );
              },
             onTapRetry: ()=>profileBloc..add(GetProfileEvent())
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


        ],
      ),
    );
  }
}