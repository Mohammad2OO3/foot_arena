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
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    fieldBloc = getIt<FieldBloc>()..add(GetAllFieldEvent());
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
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
              // Header مع حقل البحث المحلي
              HomeHeader(
                searchController: _searchController,
                onSearchChanged: (query) {
                  setState(() {
                    _searchQuery = query;
                  });
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
                    onSuccess: (data) {
                      final allFields = data?.data ?? [];

                      // تصفية القائمة حسب الاسم (Search Filtering)
                      final filteredFields = allFields.where((field) {
                        final name = field.name?.toLowerCase() ?? '';
                        final query = _searchQuery.trim().toLowerCase();
                        return name.contains(query);
                      }).toList();

                      // في حال عدم وجود نتائج تطابق كلمة البحث
                      if (filteredFields.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 40),
                          child: Center(
                            child: Text(
                              'No fields found matching your search',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                      }

                      return ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        children: filteredFields
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
                    onTapRetry: () => fieldBloc.add(GetAllFieldEvent()),
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
        child: const Icon(Icons.chat),
      ),
    );
  }
}

