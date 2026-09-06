import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/common/extensions/extensions.dart';
import 'package:footarena/core/di/injection.dart';
import 'package:footarena/features/field/presentation/bloc/field_bloc.dart';
import 'package:footarena/features/home/presentation/pages/pitch_details_page.dart';
import 'package:footarena/router/app_router.dart';
import '../widgets/home_header.dart';
import '../widgets/pitch_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final FieldBloc fieldBloc;

  @override
  void initState() {
    fieldBloc = getIt<FieldBloc>()..add(GetAllFieldEvent());
    // TODO: implement initState
    super.initState();
  }

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
                  'Recommended Matches',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Pitch Cards List
              BlocBuilder<FieldBloc, FieldState>(
                bloc: fieldBloc,
                builder: (context, state) {
                  return state.getAllFieldData.builder(
                    onSuccess: (_) {
                      return ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: state.getAllFieldData.data!.data!
                            .map(
                              (e) => PitchCard(
                                pitch: e,
                                onTap: () {
                                  context.pushNamed(
                                    RouteName.pitchDetailsPage,
                                    arguments: PitchDetailsScreenParams(
                                      id: e.id!,
                                      fieldBloc: fieldBloc,
                                    ),
                                  );
                                },
                                onFavoriteTap: () {},
                              ),
                            )
                            .toList(),
                      );
                    },
                    onTapRetry: () => fieldBloc..add(GetAllFieldEvent()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushNamed(RouteName.message);
        },
        child: Icon(Icons.chat),
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
