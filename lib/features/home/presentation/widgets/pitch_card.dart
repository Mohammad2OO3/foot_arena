import 'package:flutter/material.dart';

import '../pages/home_screen.dart';

class PitchCard extends StatelessWidget {
  final PitchModel pitch;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  const PitchCard({
    super.key,
    required this.pitch,
    this.onTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: const Color(0xFF111723),
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Stack
            Stack(
              children: [
                Image.network(
                  pitch.imageUrl,
                  height: 190,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 190,
                    color: Colors.grey[900],
                    child: const Icon(Icons.sports_soccer, size: 50, color: Colors.white24),
                  ),
                ),
               
              ],
            ),

            // Content Details
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pitch.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        pitch.rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined, color: Colors.white54, size: 18),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          pitch.location,
                          style: const TextStyle(color: Colors.white54, fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '\$${pitch.hourlyPrice.toStringAsFixed(0)}',
                              style: const TextStyle(
                                color: Color(0xFF00E676),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const TextSpan(
                              text: '/hour',
                              style: TextStyle(color: Colors.white54, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '\$${pitch.halfHourPrice.toStringAsFixed(0)}',
                              style: const TextStyle(
                                color: Color(0xFF00E676),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const TextSpan(
                              text: '/half',
                              style: TextStyle(color: Colors.white54, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}