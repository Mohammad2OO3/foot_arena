import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/features/community/presentation/pages/add_team_screen.dart';
import 'package:footarena/features/community/presentation/pages/team_details_page.dart';
import 'package:footarena/features/splash/page/splash_screen.dart';

import '../core/di/injection.dart'; // تأكد من مسار الـ injection لديك
import '../features/auth/presentation/pages/CompleteProfileScreen.dart';
import '../features/auth/presentation/pages/login_screen.dart';
import '../features/community/presentation/pages/community_page.dart';
import '../features/home/presentation/pages/pitch_details_page.dart';
import '../features/onboarding/pages/onboarding.dart';
import '../features/profile/presentation/bloc/profile_bloc.dart';
import '../features/profile/presentation/bloc/profile_event.dart';
import '../features/profile/presentation/pages/edit_profile_page.dart';
import '../features/profile/presentation/pages/profile_page.dart';
import '../main_wrapper_screen.dart';

class RouteName {
  RouteName._();

  static const onBoard = "on_boarding";
  static const login = "login";
  static const completeProfile = "complete_profile";
  static const home = "home";
  static const splash = "splash";
  static const communityPage = "CommunityPage";
  static const pitchDetailsPage = "pitchDetailsPage";
  static const profile = "profile";
  static const editProfile = "EditProfile";
  static const teamDetails = "TeamDetailsPage";
  static const addTeamScreen = "AddTeamScreen";

  // مسار شاشة البروفايل
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
        case RouteName.editProfile:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => EditProfilePage(
            args: routeSettings.arguments as EditProfilePageParams,
          ),
        );
      case RouteName.addTeamScreen:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => AddTeamScreen(
            args: routeSettings.arguments as AddTeamScreenParams,
          ),
        );

      case RouteName.splash:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => SplashScreen(),
        );
      case RouteName.pitchDetailsPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => PitchDetailsScreen(
            args: routeSettings.arguments as PitchDetailsScreenParams,
          ),
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
          builder: (_) => const MainWrapperScreen(),
        );

      case RouteName.communityPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const CommunityPage(),
        );
        case RouteName.teamDetails:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) =>  TeamDetailsPage(
            args: routeSettings.arguments as TeamDetailsPageParams,
          ),

        );

      case RouteName.profile:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => BlocProvider<ProfileBloc>(
            create: (context) =>
                getIt<ProfileBloc>()..add(FetchProfileDataEvent()),
            child: const ProfilePage(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
