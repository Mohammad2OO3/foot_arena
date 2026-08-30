import 'package:flutter/material.dart';

class BookingDatePicker extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onTap;

  const BookingDatePicker({
    super.key,
    required this.selectedDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.calendar_today_outlined, color: Color(0xFF00E676), size: 20),
            SizedBox(width: 8),
            Text(
              'Select Date',
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF111827),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${selectedDate.month.toString().padLeft(2, '0')}/${selectedDate.day.toString().padLeft(2, '0')}/${selectedDate.year}",
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                const Icon(Icons.calendar_month, color: Colors.white54, size: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}