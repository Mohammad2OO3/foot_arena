import 'package:flutter/material.dart';
import 'package:footarena/common/models/team_model.dart';

import '../bloc/community_bloc.dart';

class TeamCard extends StatelessWidget {
  final TeamModel teamModel;
  final CommunityBloc communityBloc;


  const TeamCard({
    super.key,
    required this.teamModel,
    required this.communityBloc,
  });

// name: e.name??"Team Name",
// members: e.membersCount.toString(),
//
// status: e.pendingJoinRequestsCount??'status',
// logo: Icons.bolt,

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1D1C),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF00C853).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.bolt, color: const Color(0xFF00C853)),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    teamModel.name ?? "Team Name",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.group, color: Colors.grey, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        teamModel.membersCount.toString(),
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
// const SizedBox(width: 10),
// const Icon(Icons.star, color: Colors.amber, size: 14),
// const SizedBox(width: 4),
// Text(rating, style: const TextStyle(color: Colors.white, fontSize: 12)),
//
                    ],
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      teamModel.pendingJoinRequestsCount ?? 'status',
                      style: const TextStyle(
                        color: Color(0xFF00C853),
                        fontSize: 10,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    communityBloc.add(RequestToJointEvent(id: teamModel.id!));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00C853).withOpacity(0.15),
                    foregroundColor: const Color(0xFF00C853),
                    elevation: 0,
                  ),
                  child: const Text("Join Team"),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},

                  icon: const Icon(Icons.sports_mma_outlined),
                  label: const Text("Challenge"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
