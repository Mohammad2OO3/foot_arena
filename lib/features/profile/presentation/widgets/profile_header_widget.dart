import 'package:flutter/material.dart';
import 'package:footarena/common/models/user_model.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final UserModel profile;
  const ProfileHeaderWidget({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 180,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color(0xFF00C853),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 48),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Profile", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              IconButton(icon: const Icon(Icons.settings_outlined, color: Colors.white, size: 28), onPressed: () {}),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 100, left: 16, right: 16),
          padding: const EdgeInsets.fromLTRB(16, 70, 16, 24),
          decoration: BoxDecoration(color: const Color(0xFF111827), borderRadius: BorderRadius.circular(24)),
          child: Column(
            children: [
              Text(profile.firstName??'User Name', style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(profile.position??'Position', style: const TextStyle(color: Color(0xFF00C853), fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              // Row(
              //   children: [
              //     Expanded(child: _buildStatCard("${profile.matchesCount}", "Matches")),
              //     const SizedBox(width: 12),
              //     Expanded(child: _buildStatCard("${profile.teamsCount}", "Teams")),
              //   ],
              // ),
              const SizedBox(height: 24),
              _buildInfoRow(Icons.calendar_today_outlined, "Age", "${profile.age} years"),
              _buildInfoRow(Icons.straighten_outlined, "Height", "${profile.height} cm"),
              _buildInfoRow(Icons.fitness_center_outlined, "Weight", "${profile.weight} kg"),
              _buildInfoRow(Icons.location_on_outlined, "Position", profile.position??'Position'),
              _buildInfoRow(Icons.emoji_events_outlined, "Experience", "${profile.experienceYears} years"),
            ],
          ),
        ),
        Positioned(
          top: 50,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(color: Color(0xFF111827), shape: BoxShape.circle),
                child: const CircleAvatar(radius: 50, backgroundColor: Color(0xFF00C853), child: Icon(Icons.person, size: 60, color: Colors.white)),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(color: Color(0xFF00C853), shape: BoxShape.circle),
                  child: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  static Widget _buildStatCard(String value, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(color: const Color(0xFF1E293B), borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          Text(value, style: const TextStyle(color: Color(0xFF00C853), fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      ),
    );
  }

  static Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF00C853), size: 22),
          const SizedBox(width: 16),
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 15)),
          const Spacer(),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}