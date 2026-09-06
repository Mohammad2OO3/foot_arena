import 'package:flutter/material.dart';
import 'package:footarena/features/community/presentation/bloc/community_bloc.dart';

class PlayerCard extends StatelessWidget {
  final int id;
  final String name;
  final String position;
  final int level;
  final int age;
  final CommunityBloc communityBloc;

  const PlayerCard({
    super.key,
    required this.name,
    required this.position,
    required this.id,
    required this.level,
    required this.age,
    required this.communityBloc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1D1C),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white10,
            child: Icon(Icons.person, color: Colors.white54, size: 36),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          Text(position, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 6),

          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF00C853).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: .center,

              children: [
                Text("Experience :", style: const TextStyle(color: Color(0xFF00C853), fontSize: 11,)),

                Text(level.toString(), style: const TextStyle(color: Color(0xFF00C853), fontSize: 11)),
              ],
            ),
          ),
          const SizedBox(height: 6),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFF00C853).withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: .center,
              children: [
                Text("Age :", style: const TextStyle(color: Color(0xFF00C853), fontSize: 11)),

                Text(age.toString(), style: const TextStyle(color: Color(0xFF00C853), fontSize: 11)),
              ],
            ),
          ),

          // const SizedBox(height: 10),
          // SizedBox(
          //   width: double.infinity,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       communityBloc.add(RequestToJointEvent(id:id ));
          //     },
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: const Color(0xFF00C853).withOpacity(0.15),
          //       foregroundColor: const Color(0xFF00C853),
          //       elevation: 0,
          //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          //     ),
          //     child: const Text("Invite"),
          //   ),
          // )
        ],
      ),
    );
  }
}