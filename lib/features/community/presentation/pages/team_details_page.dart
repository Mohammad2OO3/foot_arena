import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/common/extensions/extensions.dart';
import 'package:footarena/common/helper/helper.dart';
import 'package:footarena/core/di/injection.dart';
import 'package:footarena/features/community/presentation/bloc/community_bloc.dart';
import 'package:footarena/router/app_router.dart';
import '../widgets/team_details_widget.dart';
import 'my_team_request_screen.dart';

class TeamDetailsPage extends StatefulWidget {
  final TeamDetailsPageParams args;

  const TeamDetailsPage({super.key, required this.args});

  @override
  State<TeamDetailsPage> createState() => _TeamDetailsPageState();
}

class _TeamDetailsPageState extends State<TeamDetailsPage> {
  late final CommunityBloc communityBloc;

  @override
  void initState() {
    super.initState();
    communityBloc = getIt<CommunityBloc>();
    if (widget.args.isMyTeam) {
      communityBloc.add(GetMyTeamEvent());
    } else {
      communityBloc.add(GetTeamDetailsEvent(id: widget.args.teamId!));
    }
  }

  void _showLeaveTeamDialog(BuildContext context, int teamId) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: const Color(0xFF1B1D1C),
          title: const Text(
            'Leave Team',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          content: const Text(
            'Are you sure you want to leave this team?',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext); // زر الرفض / الإلغاء
              },
              child: const Text('Cancel', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.pop(dialogContext); // إغلاق الـ Dialog
                communityBloc.add(LeaveTeamEvent(id: teamId));
              },
              child: const Text('Leave', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommunityBloc, CommunityState>(
      bloc: communityBloc,
      listenWhen: (previous, current) =>
          previous.leaveTeamData != current.leaveTeamData,
      listener: (context, state) {
        state.leaveTeamData.listenerFunction(
          onSuccess: () {
            context.pop(); // العودة للخلف عند النجاح في مغادرة الفريق
          },
        );
      },
      child: BlocBuilder<CommunityBloc, CommunityState>(
        bloc: communityBloc,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xFF050B12),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: const BackButton(color: Colors.white),
              actions: widget.args.isMyTeam
                  ? [
                      state.getMyTeamData.builder(
                        onSuccess: (data) {
                          final team = data!.data;
                          final isCaptain =
                              team?.captain?.id == AppVariables.user?.id;

                          if (isCaptain) {
                            // إذا كان الكابتن: يظهر فقط زر الطلبات
                            return IconButton(
                              icon: const Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                context.pushNamed(
                                  RouteName.myTeamRequestScreen,
                                  arguments: MyTeamRequestScreenParams(
                                    communityBloc: communityBloc,
                                    teamId: team!.id!,
                                  ),
                                );
                              },
                            );
                          } else {
                            // إذا لم يكن الكابتن: يظهر فقط زر المغادرة
                            return IconButton(
                              icon: const Icon(
                                Icons.logout_outlined,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                _showLeaveTeamDialog(context, team!.id!);
                              },
                            );
                          }
                        },
                        failedWidget: const SizedBox(),
                        loadingWidget: const SizedBox(),
                      ),
                    ]
                  : [],
            ),
            body: widget.args.isMyTeam
                ? state.getMyTeamData.builder(
                    onSuccess: (data) {
                      return TeamDetailsWidget(teamModel: data!.data!);
                    },
                    onTapRetry: () => communityBloc.add(GetMyTeamEvent()),
                  )
                : state.getTeamDetailsData.builder(
                    onSuccess: (data) {
                      return TeamDetailsWidget(teamModel: data!.data!);
                    },
                    onTapRetry: () => communityBloc.add(
                      GetTeamDetailsEvent(id: widget.args.teamId!),
                    ),
                  ),
          );
        },
      ),
    );
  }
}

class TeamDetailsPageParams {
  final bool isMyTeam;
  final int? teamId;

  TeamDetailsPageParams({this.isMyTeam = true, this.teamId});
}
