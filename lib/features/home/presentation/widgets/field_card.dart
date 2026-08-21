import 'package:flutter/material.dart';

import '../../data/models/field_entity.dart';


class FieldCard extends StatelessWidget {
  final FieldEntity field;

  const FieldCard({
    super.key,
    required this.field,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 185,
      decoration: BoxDecoration(
        color: const Color(0xff161A23),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Colors.white10,
        ),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(
                  top: Radius.circular(22),
                ),
                child: Image.asset(
                  field.image,
                  height: 130,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius:
                    BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        field.rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Text(
                  field.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white54,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      field.location,
                      style: const TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 18),

                Row(
                  children: [
                    Text(
                      field.hourPrice,
                      style: const TextStyle(
                        color: Color(0xff00E676),
                        fontSize: 24,
                      ),
                    ),
                    const Text(
                      "/hour",
                      style: TextStyle(
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}