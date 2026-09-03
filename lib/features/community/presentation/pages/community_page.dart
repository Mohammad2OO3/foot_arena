import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:footarena/common/design/design.dart';
import '../../../../core/di/injection.dart';
import '../../../../router/app_router.dart';
import '../bloc/community_bloc.dart';
import '../widgets/community_tab_bar.dart';
import '../widgets/match_card.dart';
import '../widgets/team_card.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  late CommunityBloc _communityBloc;

  @override
  void initState() {
    _communityBloc = getIt<CommunityBloc>()..add(GetAllChallengeEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0C100E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text(
                "Community",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              CommunityTabBar(communityBloc: _communityBloc),
              const SizedBox(height: 16),
              Expanded(
                child: BlocConsumer<CommunityBloc, CommunityState>(
                  listener: (context, state) {
                    state.requestToJointData.listenerFunction(onSuccess: () {});
                    state.addChallengeData.listenerFunction(onSuccess: () {});
                  },
                  bloc: _communityBloc,
                  builder: (context, state) {
                    switch (state.selectedTab) {
                      case CommunityTab.matches:
                        return state.getAllChallengeData.builder(
                          onSuccess: (data) {
                            return data!.data!.isEmpty
                                ? EmptyWidget()
                                : ListView(
                              children: data.data!
                                  .map(
                                    (e) => MatchCard(
                                  challengeModel: e,
                                  communityBloc: _communityBloc,
                                ),
                              )
                                  .toList(),
                            );
                          },
                          onTapRetry: () =>
                              _communityBloc.add(GetAllChallengeEvent()),
                        );
                    // case CommunityTab.players:
                    //   return GridView.count(
                    //     crossAxisCount: 2,
                    //     crossAxisSpacing: 12,
                    //     mainAxisSpacing: 12,
                    //     childAspectRatio: 0.72,
                    //     children: const [
                    //       PlayerCard(
                    //         name: "Alex Martinez",
                    //         position: "Striker",
                    //         rating: "4.8",
                    //         level: "Advanced",
                    //       ),
                    //       PlayerCard(
                    //         name: "Jordan Smith",
                    //         position: "Midfielder",
                    //         rating: "4.6",
                    //         level: "Intermediate",
                    //       ),
                    //       PlayerCard(
                    //         name: "Sam Wilson",
                    //         position: "Defender",
                    //         rating: "4.5",
                    //         level: "Advanced",
                    //       ),
                    //       PlayerCard(
                    //         name: "Taylor Brown",
                    //         position: "Goalkeeper",
                    //         rating: "4.9",
                    //         level: "Expert",
                    //       ),
                    //     ],
                    //   );
                      case CommunityTab.teams:
                        return state.getAllTeamData.builder(
                          onSuccess: (data) {
                            return data!.data!.isEmpty
                                ? EmptyWidget()
                                : ListView(
                              children: data.data!
                                  .map(
                                    (e) => GestureDetector(
                                  onTap: () {
                                    // الانتقال لشاشة تفاصيل الفريق مع تمرير المعرف
                                    context.pushNamed(
                                      RouteName.teamDetails,

                                    );
                                  },
                                  child: TeamCard(
                                    communityBloc: _communityBloc,
                                    teamModel: e,
                                  ),
                                ),
                              )
                                  .toList(),
                            );
                          },
                          onTapRetry: () =>
                              _communityBloc.add(GetAllTeamEvent()),
                        );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}