import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../bloc/community_bloc.dart';
import '../widgets/community_tab_bar.dart';
import '../widgets/match_card.dart';
import '../widgets/player_card.dart';
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
    _communityBloc = getIt<CommunityBloc>();
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
                child: BlocBuilder<CommunityBloc, CommunityState>(
                  builder: (context, state) {
                    switch (state.selectedTab) {
                      case CommunityTab.matches:
                        return ListView(
                          children: const [
                            MatchCard(
                              format: "6v6",
                              day: "Tonight",
                              title: "Arena Pro Stadium",
                              time: "8:00 PM",
                              playersCount: "8/12",
                              level: "Intermediate",
                            ),
                            MatchCard(
                              format: "6v6",
                              day: "Tomorrow",
                              title: "Victory Ground",
                              time: "6:00 PM",
                              playersCount: "10/12",
                              level: "Advanced",
                            ),
                            MatchCard(
                              format: "6v6",
                              day: "Apr 28",
                              title: "Champions Field",
                              time: "7:00 PM",
                              playersCount: "6/12",
                              level: "Beginner",
                            ),
                          ],
                        );
                      case CommunityTab.players:
                        return GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.72,
                          children: const [
                            PlayerCard(
                              name: "Alex Martinez",
                              position: "Striker",
                              rating: "4.8",
                              level: "Advanced",
                            ),
                            PlayerCard(
                              name: "Jordan Smith",
                              position: "Midfielder",
                              rating: "4.6",
                              level: "Intermediate",
                            ),
                            PlayerCard(
                              name: "Sam Wilson",
                              position: "Defender",
                              rating: "4.5",
                              level: "Advanced",
                            ),
                            PlayerCard(
                              name: "Taylor Brown",
                              position: "Goalkeeper",
                              rating: "4.9",
                              level: "Expert",
                            ),
                          ],
                        );
                      case CommunityTab.teams:
                        return ListView(
                          children: const [
                            TeamCard(
                              name: "Thunder FC",
                              members: "12 players",
                              rating: "4.7",
                              status: "Ready",
                              logo: Icons.bolt,
                            ),
                            TeamCard(
                              name: "Phoenix United",
                              members: "9 players",
                              rating: "4.5",
                              status: "Need Players",
                              logo: Icons.local_fire_department,
                            ),
                            TeamCard(
                              name: "Storm Riders",
                              members: "11 players",
                              rating: "4.8",
                              status: "Ready",
                              logo: Icons.cyclone,
                            ),
                          ],
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
