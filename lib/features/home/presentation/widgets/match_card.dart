import 'package:flutter/material.dart';

import '../../data/models/match_entity.dart';

class MatchCard extends StatelessWidget {
  final MatchEntity match;

  const MatchCard({
    super.key,
    required this.match,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: const Color(0xff161A23),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius:
            const BorderRadius.horizontal(
              left: Radius.circular(22),
            ),
            child: Image.asset(
              match.image,
              width: 100,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: [
                  Text(
                    match.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    match.location,
                    style: const TextStyle(
                      color: Colors.white54,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Container(
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green
                          .withOpacity(.15),
                      borderRadius:
                      BorderRadius.circular(12),
                    ),
                    child: Text(
                      match.date,
                      style: const TextStyle(
                        color: Color(0xff00E676),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              right: 15,
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 15,
                ),
                Text(
                  match.rating.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}