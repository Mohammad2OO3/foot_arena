import 'package:flutter/material.dart';

class PitchPriceBox extends StatelessWidget {
  final double hourlyPrice;
  final double halfHourPrice;

  const PitchPriceBox({
    super.key,
    required this.hourlyPrice,
    required this.halfHourPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF00E676).withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Price per hour', style: TextStyle(color: Colors.white70, fontSize: 15)),
              Text(
                '\$${hourlyPrice.toStringAsFixed(0)}',
                style: const TextStyle(color: Color(0xFF00E676), fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Price per half hour', style: TextStyle(color: Colors.white70, fontSize: 15)),
              Text(
                '\$${halfHourPrice.toStringAsFixed(0)}',
                style: const TextStyle(color: Color(0xFF00E676), fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}