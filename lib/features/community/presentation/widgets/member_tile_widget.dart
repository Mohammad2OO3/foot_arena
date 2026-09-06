import 'package:flutter/material.dart';

class MemberTileWidget extends StatelessWidget {
  final String name;
  final String joinedDate;
  final String position;
  final String initials;
  final Color avatarColor;
  final IconData? badgeIcon;
  final VoidCallback? onTap;

  const MemberTileWidget({
    super.key,
    required this.name,
    required this.joinedDate,
    required this.initials,
    required this.avatarColor,
    required this.position,
    this.badgeIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0A121D),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF1E2D42).withOpacity(0.5)),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: Stack(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: avatarColor,
              child: Text(
                initials,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            if (badgeIcon != null)
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Color(0xFF0A121D),
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: Color(0xFF1E2D42),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(badgeIcon, color: Colors.white, size: 10),
                  ),
                ),
              ),
          ],
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          position ,
          style: const TextStyle(
            color: Color(0xFF8C9BAE),
            fontSize: 12,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Color(0xFF32455E),
          size: 14,
        ),
      ),
    );
  }
}