import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../bloc/onboarding_bloc.dart';
import '../bloc/onboarding_event.dart';
import '../bloc/onboarding_state.dart';
import '../model/model.dart';
import 'package:footarena/features/onboarding/pages/widget/widget.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final PageController _controller = PageController();

  final List<OnboardingModel> pages = [
    OnboardingModel(
      image: "assets/images/jpg/field.jpg",
      title: "Find Football Fields Near You",
      subtitle:
      "Discover the best football pitches in your area with real-time availability",
      icon: Icons.location_on,
    ),
    OnboardingModel(
      image: "assets/images/jpg/match.jpeg",
      title: "Book Matches Easily",
      subtitle:
      "Reserve your pitch in seconds and manage all your bookings in one place",
      icon: Icons.calendar_month,
    ),
    OnboardingModel(
      image: "assets/images/jpg/team.jpeg",
      title: "Join Players & Teams",
      subtitle:
      "Connect with football enthusiasts, find teammates, and join matches",
      icon: Icons.group,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final isTablet = width > 600;

    return BlocProvider(
      create: (_) => OnboardingBloc(),
      child: Scaffold(
        backgroundColor: const Color(0xFF020A1C),
        body: SafeArea(
          child: BlocBuilder<OnboardingBloc, OnboardingState>(
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(height: height * 0.02),

                  AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    padding: EdgeInsets.all(isTablet ? 28 : width * 0.05),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: state.currentIndex == 0
                            ? [Colors.green, Colors.greenAccent]
                            : state.currentIndex == 1
                            ? [Colors.blue, Colors.lightBlueAccent]
                            : [Colors.pink, Colors.purple],
                      ),
                    ),
                    child: Icon(
                      pages[state.currentIndex].icon,
                      color: Colors.white,
                      size: isTablet ? 40 : width * 0.07,
                    ),
                  ),

                  SizedBox(height: height * 0.04),

                  Expanded(
                    child: PageView.builder(
                      controller: _controller,
                      onPageChanged: (index) {
                        context
                            .read<OnboardingBloc>()
                            .add(PageChanged(index));
                      },
                      itemCount: pages.length,
                      itemBuilder: (_, index) {
                        return OnboardingItem(
                          model: pages[index],
                        );
                      },
                    ),
                  ),

                  SmoothPageIndicator(
                    controller: _controller,
                    count: pages.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Colors.green,
                      dotHeight: isTablet ? 12 : 8,
                      dotWidth: isTablet ? 12 : 8,
                      expansionFactor: 4,
                    ),
                  ),

                  SizedBox(height: height * 0.03),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.1,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (state.currentIndex == pages.length - 1) {
                          context.go('/login');
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );

                          context
                              .read<OnboardingBloc>()
                              .add(NextPressed());
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: isTablet ? 70 : height * 0.07,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            isTablet ? 40 : width * 0.08,
                          ),
                          gradient: const LinearGradient(
                            colors: [
                              Colors.green,
                              Colors.greenAccent,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green.withValues(alpha: 0.5),
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            state.currentIndex == pages.length - 1
                                ? "Get Started"
                                : "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isTablet ? 20 : width * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.05),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}