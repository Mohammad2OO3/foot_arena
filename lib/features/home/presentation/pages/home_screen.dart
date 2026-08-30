import 'package:flutter/material.dart';
import 'package:footarena/features/home/presentation/pages/pitch_details_page.dart';
import '../widgets/home_header.dart';
import '../widgets/pitch_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<PitchModel> samplePitches = const [
    PitchModel(
      id: '1',
      name: 'Arena Verde',
      rating: 4.8,
      location: 'Downtown, 2.5 km away',
      hourlyPrice: 45,
      halfHourPrice: 25,
      imageUrl: 'https://images.unsplash.com/photo-1575361204480-aadea25e6e68',

    ),
    PitchModel(
      id: '2',
      name: 'Stadium Pro',
      rating: 4.9,
      location: 'North District, 4 km away',
      hourlyPrice: 55,
      halfHourPrice: 30,
      imageUrl: 'https://images.unsplash.com/photo-1575361204480-aadea25e6e68',

    ),
    PitchModel(
      id: '3',
      name: 'Green Valley',
      rating: 4.6,
      location: 'West Side, 3.2 km away',
      hourlyPrice: 40,
      halfHourPrice: 22,
      imageUrl: 'https://images.unsplash.com/photo-1529900748604-07564a03e7a6',

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with Search Bar
              HomeHeader(
                onSearchChanged: (query) {
                  // Search logic
                },
              ),

              // Title Section
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 20, 16, 12),
                child: Text(
                  'Popular Matches Today',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Pitch Cards List
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: samplePitches.length,
                itemBuilder: (context, index) {
                  return PitchCard(
                    pitch: samplePitches[index],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(


                          builder: (context) => PitchDetailsPage(pitch: samplePitches[index]),
                        ),
                      );
                    },
                    onFavoriteTap: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class PitchModel {
  final String id;
  final String name;
  final double rating;
  final String location;
  final double hourlyPrice;
  final double halfHourPrice;
  final String imageUrl;


  const PitchModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.location,
    required this.hourlyPrice,
    required this.halfHourPrice,
    required this.imageUrl,

  });
}