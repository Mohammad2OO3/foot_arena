import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  late final PageController pageController;

  int selectedIndex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();

    pageController = PageController();

    pages = [
      const HomeScreen(),
      const CommunityPage(),
      BlocProvider<ProfileBloc>(
        create: (context) =>
        getIt<ProfileBloc>()..add(FetchProfileDataEvent()),
        child: const ProfilePage(),
      ),
    ];
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void changeIndex(int index) {
    if (selectedIndex == index) return;

    setState(() {
      selectedIndex = index;
    });

    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // إذا كنا في تب غير Home → نرجع للـ Home
        if (selectedIndex != 0) {
          changeIndex(0);

          return false;
        }

        // إذا كنا في Home → نسمح بالخروج
        return true;
      },
      child: Scaffold(
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: pages,
        ),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF141414),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 70,
          child: Row(
            children: [
              _buildNavItem(
                index: 0,
                icon: Icons.home_outlined,
                title: 'Home',
              ),
              _buildNavItem(
                index: 1,
                icon: Icons.people_outline,
                title: 'Community',
              ),
              _buildNavItem(
                index: 2,
                icon: Icons.person_outline,
                title: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String title,
  }) {
    final isSelected = selectedIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () => changeIndex(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? const Color(0xFF00C853)
                  : Colors.grey,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? const Color(0xFF00C853)
                    : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}