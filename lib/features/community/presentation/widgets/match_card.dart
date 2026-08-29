import 'package:flutter/material.dart';
import 'package:footarena/common/models/challenge_model.dart';

import '../bloc/community_bloc.dart';

class MatchCard extends StatelessWidget {
 final ChallengeModel challengeModel;
 final CommunityBloc communityBloc;

  const MatchCard({super.key, required this.challengeModel, required this.communityBloc});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00C853).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(challengeModel.field?.name ??'Filed', style: const TextStyle(color: Color(0xFF00C853), fontSize: 12)),
                  ),
                  const SizedBox(width: 8),
                  Text(challengeModel.matchDate??'10/10', style: const TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              ),
              Text(challengeModel.matchDate??'9:00', style: const TextStyle(color: Color(0xFF00C853), fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 8),
          Text(challengeModel.field?.name ??'Filed', style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.group_outlined, color: Colors.grey, size: 16),
              const SizedBox(width: 4),
              Text(((challengeModel.teamA?.membersCount??0)+(challengeModel.teamB?.membersCount??0)).toString(), style: const TextStyle(color: Colors.white)),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(12.toString(), style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  // communityBloc.add(AcceptChallengeEvent(params: params));
                  //
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00C853).withOpacity(0.2),
                  foregroundColor: const Color(0xFF00C853),
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text("Join Match"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}