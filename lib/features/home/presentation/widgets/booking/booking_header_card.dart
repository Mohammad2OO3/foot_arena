// import 'package:flutter/material.dart';
// import 'package:footarena/features/home/presentation/pages/home_screen.dart';
//
// class BookingHeaderCard extends StatelessWidget {
//   final PitchModel pitch;
//
//   const BookingHeaderCard({super.key, required this.pitch});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: const Color(0xFF111827),
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             pitch.name,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 6),
//           Text(
//             pitch.location,
//             style: const TextStyle(
//               color: Colors.white60,
//               fontSize: 13,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }