import 'package:flutter/material.dart';

class BookingDatePicker extends StatelessWidget {
  final ValueNotifier<DateTime?> selectedDateNotifier;
  final VoidCallback onTap;

  const BookingDatePicker({
    super.key,
    required this.selectedDateNotifier,
    required this.onTap,
  });

  String _formatDate(DateTime? date) {
    if (date == null) return '';

    return '${date.month.toString().padLeft(2, '0')}/'
        '${date.day.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDateNotifier.value ?? now,
      firstDate: now,
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF00E676),
              onPrimary: Colors.black,
              surface: Color(0xFF111827),
              onSurface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedDateNotifier.value = picked;
      onTap();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _selectDate(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.calendar_today_outlined,
                color: Color(0xFF00E676),
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                'Select Date',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF111827),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ValueListenableBuilder<DateTime?>(
              valueListenable: selectedDateNotifier,
              builder: (context, selectedDate, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _formatDate(selectedDate),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const Icon(
                      Icons.calendar_month,
                      color: Colors.white54,
                      size: 20,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}