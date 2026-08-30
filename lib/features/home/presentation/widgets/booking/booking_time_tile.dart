import 'package:flutter/material.dart';

class BookingTimeTile extends StatelessWidget {
  final String selectedTime;

  const BookingTimeTile({super.key, required this.selectedTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.access_time, color: Color(0xFF00E676), size: 20),
            SizedBox(width: 8),
            Text(
              'Select Time',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF111827),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            selectedTime,
            style: const TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ],
    );
  }
}