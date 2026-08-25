import 'package:flutter/material.dart';
import 'player_card.dart';

class PlayersTabView extends StatelessWidget {
  const PlayersTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.72,
      children: const [
        PlayerCard(name: "Alex Martinez", position: "Striker", rating: "4.8", level: "Advanced"),
        PlayerCard(name: "Jordan Smith", position: "Midfielder", rating: "4.6", level: "Intermediate"),
        PlayerCard(name: "Sam Wilson", position: "Defender", rating: "4.5", level: "Advanced"),
        PlayerCard(name: "Taylor Brown", position: "Goalkeeper", rating: "4.9", level: "Expert"),
      ],
    );
  }
}