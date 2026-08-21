import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/pages/CompleteProfileScreen.dart';
import '../features/auth/presentation/pages/login_screen.dart';
import '../features/community/presentation/pages/FindPlayersTeamsScreen.dart';
import '../features/home/presentation/pages/home_screen.dart';

import '../features/onboarding/pages/onboarding.dart';


class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/FindPlayersTeamsScreen',

    routes: [
      GoRoute(
        path: '/on_boarding',
        builder: (context, state) => OnBoardingScreen(),
      ),

      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
   GoRoute(
        path: '/complete_profile',
        builder: (context, state) => const CompleteProfileScreen(),
      ),

      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),

      GoRoute(
        path: '/FindPlayersTeamsScreen',
        builder: (context, state) => const FindPlayersTeamsScreen(),
      ),
    ],

    errorBuilder: (context, state) => const Scaffold(
      body: Center(child: Text('Page not found')),
    ),
  );
}