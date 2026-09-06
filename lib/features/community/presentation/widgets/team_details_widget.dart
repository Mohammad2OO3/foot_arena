
import 'package:flutter/material.dart';
import 'package:footarena/features/community/presentation/widgets/team_header_card.dart';
import 'package:footarena/features/community/presentation/widgets/team_stats_card.dart';

import '../../../../common/models/team_model.dart';
import 'member_tile_widget.dart';

class TeamDetailsWidget extends StatelessWidget {

  final TeamModel teamModel;

  const TeamDetailsWidget({super.key, required this.teamModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Team Header Section
          TeamHeaderCard(
            teamName: teamModel.name ?? 'Team Name',
            description:
            teamModel.description ?? "Description",
            captainName:
            '${teamModel.captain?.firstName ?? ''} ${teamModel.captain?.lastName ?? ''}',
          ),
          const SizedBox(height: 16),

          // 2. Stats Section Row
           Row(
            children: [
              Expanded(
                child: TeamStatsCard(
                  title: "Total Members",
                  value: teamModel.members?.length.toString()??'',
                  icon: Icons.people_outline,
                  iconColor: Color(0xFF00E676),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: TeamStatsCard(
                  title: "Pending Requests",
                  value: teamModel.pendingJoinRequestsCount??'0',
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: const Color(
                    0xFF00E676,
                  ).withOpacity(0.12),
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

          Column(
            children: teamModel.members!.isEmpty
                ? []
                : teamModel.members!
                .map(
                  (e) => MemberTileWidget(
                name:
                '${e.user?.firstName ?? ''} ${e.user?.lastName ?? ''}',

                joinedDate: e.joinedAt??'Joined Date',
                initials: "OH",
                avatarColor: const Color(0xFF03A9F4),
                badgeIcon: Icons.ads_click,
                onTap: () {},
                    position: e.user?.position??'Position',
              ),
            )
                .toList(),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
