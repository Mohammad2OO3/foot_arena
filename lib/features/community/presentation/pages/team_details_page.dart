import 'package:flutter/material.dart';
import '../widgets/member_tile_widget.dart';
import '../widgets/team_header_card.dart';
import '../widgets/team_stats_card.dart';

class TeamDetailsPage extends StatelessWidget {
  const TeamDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050B12),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Team Header Section
            const TeamHeaderCard(
              teamName: "Thunder FC",
              division: "Premier Division · London, UK",
              description:
              "Competitive club founded in 2019. Fast, technical football — competing in the London Premier Division every season.",
              captainName: "James Torres",
            ),
            const SizedBox(height: 16),

            // 2. Stats Section Row
            const Row(
              children: [
                Expanded(
                  child: TeamStatsCard(
                    title: "Total Members",
                    value: "11",
                    icon: Icons.people_outline,
                    iconColor: Color(0xFF00E676),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: TeamStatsCard(
                    title: "Pending Requests",
                    value: "3",
                    icon: Icons.access_time,
                    iconColor: Color(0xFFFFB300),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 3. Team Members Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Team Members",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF00E676).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "11 Players",
                    style: TextStyle(
                      color: Color(0xFF00E676),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // 4. Members List
            MemberTileWidget(
              name: "Marcus Silva",
              joinedDate: "Jan 15, 2024",
              initials: "MS",
              avatarColor: const Color(0xFFFF5722),
              badgeIcon: Icons.flash_on,
              onTap: () {},
            ),
            MemberTileWidget(
              name: "Alex Morgan",
              joinedDate: "Feb 3, 2024",
              initials: "AM",
              avatarColor: const Color(0xFF2196F3),
              badgeIcon: Icons.ads_click,
              onTap: () {},
            ),
            MemberTileWidget(
              name: "James Torres",
              joinedDate: "Mar 22, 2024",
              initials: "JT",
              avatarColor: const Color(0xFF9C27B0),
              badgeIcon: Icons.shield,
              onTap: () {},
            ),
            MemberTileWidget(
              name: "Daniel Chen",
              joinedDate: "Apr 8, 2024",
              initials: "DC",
              avatarColor: const Color(0xFFFFB300),
              badgeIcon: Icons.emoji_events,
              onTap: () {},
            ),
            MemberTileWidget(
              name: "Omar Hassan",
              joinedDate: "May 17, 2024",
              initials: "OH",
              avatarColor: const Color(0xFF03A9F4),
              badgeIcon: Icons.ads_click,
              onTap: () {},
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}