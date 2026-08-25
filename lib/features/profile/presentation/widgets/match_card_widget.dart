import 'package:flutter/material.dart';
import '../../data/models/user_match_model.dart';

class MatchCardWidget extends StatelessWidget {
  final UserMatchModel match;
  const MatchCardWidget({super.key, required this.match});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xFF111827), borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(match.title, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Text(match.date, style: const TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: match.isWon ? const Color(0xFF064E3B) : const Color(0xFF1E3A8A),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              match.status,
              style: TextStyle(
                color: match.isWon ? const Color(0xFF34D399) : const Color(0xFF60A5FA),
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}