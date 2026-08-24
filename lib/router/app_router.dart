import 'package:flutter/material.dart';
import 'package:footarena/features/splash/page/splash_screen.dart';

import '../features/auth/presentation/pages/CompleteProfileScreen.dart';
import '../features/auth/presentation/pages/login_screen.dart';
import '../features/community/presentation/pages/FindPlayersTeamsScreen.dart';
import '../features/home/presentation/pages/home_screen.dart';
import '../features/onboarding/pages/onboarding.dart';

class RouteName {
  RouteName._();

  static const onBoard = "on_boarding";
  static const login = "login";
  static const completeProfile = "complete_profile";
  static const home = "home";
  static const splash = "splash";
  static const findPlayersTeams = "FindPlayersTeamsScreen";
}

class RouteManager {
  RouteManager._();

  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteName.onBoard:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => OnBoardingScreen(),
        );
        case RouteName.splash:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => SplashScreen(),
        );

      case RouteName.login:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const LoginScreen(),
        );

      case RouteName.completeProfile:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => CompleteProfileScreen(
            args: routeSettings.arguments as CompleteProfileParams,
          ),
        );

      case RouteName.home:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const HomeScreen(),
        );

      case RouteName.findPlayersTeams:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const FindPlayersTeamsScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
