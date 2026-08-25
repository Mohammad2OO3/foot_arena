import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'core/di/injection.dart';
import 'features/community/presentation/pages/community_page.dart';
import 'features/home/presentation/pages/home_screen.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';
import 'features/profile/presentation/bloc/profile_event.dart';
import 'features/profile/presentation/pages/profile_page.dart';

class MainWrapperScreen extends StatefulWidget {
  const MainWrapperScreen({super.key});

  @override
  State<MainWrapperScreen> createState() => _MainWrapperScreenState();
}

class _MainWrapperScreenState extends State<MainWrapperScreen> {
  final PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<PersistentTabConfig> _tabs() => [
    PersistentTabConfig(
      screen: const HomeScreen(),
      item: ItemConfig(
        icon: const Icon(Icons.home_outlined),
        title: "Home",
        activeForegroundColor: const Color(0xFF00C853),
        inactiveForegroundColor: Colors.grey,
      ),
    ),
    PersistentTabConfig(
      screen: const CommunityPage(),
      item: ItemConfig(
        icon: const Icon(Icons.people_outline),
        title: "Community",
        activeForegroundColor: const Color(0xFF00C853),
        inactiveForegroundColor: Colors.grey,
      ),
    ),
    PersistentTabConfig(
      screen: BlocProvider<ProfileBloc>(
        create: (context) => getIt<ProfileBloc>()..add( FetchProfileDataEvent()),
        child: const ProfilePage(),
      ),
      item: ItemConfig(
        icon: const Icon(Icons.person_outline),
        title: "Profile",
        activeForegroundColor: const Color(0xFF00C853),
        inactiveForegroundColor: Colors.grey,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: _controller,
      tabs: _tabs(),
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: const NavBarDecoration(
          color: Color(0xFF141414),
        ),
      ),
    );
  }
}