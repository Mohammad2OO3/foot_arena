import 'package:flutter/material.dart';
import 'package:footarena/features/home/presentation/pages/home_screen.dart';
import '../widgets/pitch_details/pitch_amenities_list.dart';
import '../widgets/pitch_details/pitch_available_slots.dart';
import '../widgets/pitch_details/pitch_header_image.dart';
import '../widgets/pitch_details/pitch_info_header.dart';
import '../widgets/pitch_details/pitch_price_box.dart';
import 'book_field_page.dart';

class PitchDetailsPage extends StatefulWidget {
  final PitchModel pitch;

  const PitchDetailsPage({super.key, required this.pitch});

  @override
  State<PitchDetailsPage> createState() => _PitchDetailsPageState();
}

class _PitchDetailsPageState extends State<PitchDetailsPage> {
  String? selectedSlot;

  final List<String> availableSlots = [
    '07:00 - 08:00',
    '15:00 - 16:00',
    '17:00 - 18:00',
    '18:00 - 19:00',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PitchHeaderImage(imageUrl: widget.pitch.imageUrl),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PitchInfoHeader(pitch: widget.pitch),
                  const SizedBox(height: 24),
                  const PitchAmenitiesList(),
                  const SizedBox(height: 24),
                  PitchAvailableSlots(
                    availableSlots: availableSlots,
                    selectedSlot: selectedSlot,
                    onSlotSelected: (slot) {
                      setState(() {
                        selectedSlot = slot;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  PitchPriceBox(
                    hourlyPrice: widget.pitch.hourlyPrice,
                    halfHourPrice: widget.pitch.halfHourPrice,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () {
                        if (selectedSlot == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please select a time slot first')),
                          );
                          return;
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookFieldPage(
                              pitch: widget.pitch,
                              selectedTime: selectedSlot,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00C853),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                      ),
                      child: const Text(
                        'Book Match',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
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