import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/core/di/injection.dart';
import 'package:footarena/features/community/presentation/bloc/community_bloc.dart';
import '../widgets/member_tile_widget.dart';
import '../widgets/team_details_widget.dart';
import '../widgets/team_header_card.dart';
import '../widgets/team_stats_card.dart';

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
