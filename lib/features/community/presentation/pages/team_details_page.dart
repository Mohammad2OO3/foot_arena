import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/common/extensions/extensions.dart';
import 'package:footarena/core/di/injection.dart';
import 'package:footarena/features/community/presentation/bloc/community_bloc.dart';
import 'package:footarena/router/app_router.dart';
import '../widgets/member_tile_widget.dart';
import '../widgets/team_details_widget.dart';
import '../widgets/team_header_card.dart';
import '../widgets/team_stats_card.dart';
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
    communityBloc = getIt<CommunityBloc>();
    if (widget.args.isMyTeam) {
      communityBloc.add(GetMyTeamEvent());
    } else {
      communityBloc.add(GetTeamDetailsEvent(id: widget.args.teamId!));
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityBloc, CommunityState>(
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
                    IconButton(
                      icon: Icon(Icons.notifications, color: Colors.white),
                      onPressed: () {
                        context.pushNamed(RouteName.myTeamRequestScreen,
                            arguments:
                            MyTeamRequestScreenParams(
                          communityBloc: communityBloc,
                          teamId: state.getMyTeamData.data!.data!.id!
                        ));
                      },
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
    );
  }
}

class TeamDetailsPageParams {
  final bool isMyTeam;
  final int? teamId;

  TeamDetailsPageParams({this.isMyTeam = true, this.teamId});
}
