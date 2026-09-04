import 'package:flutter/material.dart';

class TeamHeaderCard extends StatelessWidget {
  final String teamName;
  final String description;
  final String captainName;

  const TeamHeaderCard({
    super.key,
    required this.teamName,
    required this.description,
    required this.captainName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF0A121D),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF1E2D42).withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Team Logo Box with Glowing Effect
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFF00E676),
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00E676).withOpacity(0.4),
                      blurRadius: 16,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.flash_on,
                  color: Colors.white,
                  size: 34,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      teamName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // const SizedBox(height: 4),
                    // Text(
                    //   division,
                    //   style: const TextStyle(
                    //     color: Color(0xFF8C9BAE),
                    //     fontSize: 13,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(
              color: Color(0xFFB0BEC5),
              fontSize: 14,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          // Captain Tag & Name
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2408),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFFB300)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.workspace_premium, color: Color(0xFFFFB300), size: 14),
                    SizedBox(width: 4),
                    Text(
                      "Captain",
                      style: TextStyle(
                        color: Color(0xFFFFB300),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Text(
                captainName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}