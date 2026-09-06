import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/common/design/design.dart';
import 'package:footarena/common/extensions/extensions.dart';

import '../../../../common/models/user_model.dart';
import '../bloc/community_bloc.dart';
import '../widgets/member_tile_widget.dart';
import '../widgets/request_to_join_team_widget.dart';

class MyTeamRequestScreen extends StatefulWidget {
  final MyTeamRequestScreenParams args;

  const MyTeamRequestScreen({super.key, required this.args});

  @override
  State<MyTeamRequestScreen> createState() => _MyTeamRequestScreenState();
}

class _MyTeamRequestScreenState extends State<MyTeamRequestScreen> {
  late final CommunityBloc communityBloc;

  @override
  void initState() {
    communityBloc = widget.args.communityBloc
      ..add(GetAllRequestToJointEvent(id: widget.args.teamId));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: Text("Requests", style: context.bodyMedium(color: Colors.white,fontSize: 18)),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<CommunityBloc, CommunityState>(
          bloc: communityBloc,
          builder: (context, state) {
            return state.getAllRequestToJointData.builder(
              onSuccess: (data) {

                return data!.data!.isEmpty
                    ? EmptyWidget()
                    : ListView(
                        children: data.data!
                            .map(
                              (e) => RequestToJoinTeamWidget(
                                communityBloc: communityBloc,
                                userModel: e.user!,
                                teamId: widget.args.teamId,
                              ),
                            )
                            .toList(),
                      );
              },
              onTapRetry: () =>
                  communityBloc
                    ..add(GetAllRequestToJointEvent(id: widget.args.teamId)),
            );
          },
        ),
      ),
    );
  }
}

class MyTeamRequestScreenParams {
  final CommunityBloc communityBloc;
  final int teamId;

  MyTeamRequestScreenParams({
    required this.communityBloc,
    required this.teamId,
  });
}
