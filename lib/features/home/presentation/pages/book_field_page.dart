import 'package:flutter/material.dart';
import 'package:footarena/features/home/presentation/pages/home_screen.dart';
import '../widgets/booking/booking_date_picker.dart';
import '../widgets/booking/booking_header_card.dart';
import '../widgets/booking/booking_match_type_selector.dart';
import '../widgets/booking/booking_price_summary.dart';
import '../widgets/booking/booking_success_dialog.dart';
import '../widgets/booking/booking_time_tile.dart';

class BookFieldPage extends StatefulWidget {
  final PitchModel pitch;
  final String? selectedTime;

  const BookFieldPage({
    super.key,
    required this.pitch,
    this.selectedTime,
  });

  @override
  State<BookFieldPage> createState() => _BookFieldPageState();
}

class _BookFieldPageState extends State<BookFieldPage> {
  DateTime selectedDate = DateTime.now();
  late String selectedTime;
  String selectedMatchType = '6v6';

  final List<String> matchTypes = ['6v6'];

  @override
  void initState() {
    super.initState();
    selectedTime = widget.selectedTime ?? '18:00 - 19:00';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
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
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B121E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Book Field',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BookingHeaderCard(pitch: widget.pitch),
            const SizedBox(height: 24),
            // BookingDatePicker(
            //   selectedDate: selectedDate,
            //   onTap: () => _selectDate(context),
            // ),
            const SizedBox(height: 24),
            BookingTimeTile(selectedTime: selectedTime),
            const SizedBox(height: 24),
            BookingMatchTypeSelector(
              selectedMatchType: selectedMatchType,
              matchTypes: matchTypes,
              onChanged: (newValue) {
                if (newValue != null) {
                  setState(() => selectedMatchType = newValue);
                }
              },
            ),
            const SizedBox(height: 28),
            BookingPriceSummary(hourlyPrice: widget.pitch.hourlyPrice),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  final formattedDate =
                      "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.day.toString().padLeft(2, '0')}";
                  final dateTimeText = "$formattedDate at $selectedTime";
                  final bookingCode =
                      "FOOTARENA-3-${DateTime.now().millisecondsSinceEpoch}";

                  // showDialog(
                  //   context: context,
                  //   builder: (context) => BookingSuccessDialog(
                  //     fieldName: widget.pitch.name,
                  //     dateTime: dateTimeText,
                  //     matchType: selectedMatchType,
                  //     totalPrice: widget.pitch.hourlyPrice,
                  //     bookingCode: bookingCode,
                  //   ),
                  // );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00C853),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text(
                  'Confirm Booking',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}