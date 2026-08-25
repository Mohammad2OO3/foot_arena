import 'package:flutter/material.dart';
import 'team_card.dart';

class TeamsTabView extends StatelessWidget {
  const TeamsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        TeamCard(name: "Thunder FC", members: "12 players", rating: "4.7", status: "Ready", logo: Icons.bolt),
        TeamCard(name: "Phoenix United", members: "9 players", rating: "4.5", status: "Need Players", logo: Icons.local_fire_department),
        TeamCard(name: "Storm Riders", members: "11 players", rating: "4.8", status: "Ready", logo: Icons.cyclone),
      ],
    );
  }
}