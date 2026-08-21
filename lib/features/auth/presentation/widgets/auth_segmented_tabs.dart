import 'package:flutter/material.dart';
import 'package:footarena/common/extensions/extensions.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common/design/design.dart';

class AuthSegmentedTabs extends StatelessWidget {
  const AuthSegmentedTabs({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(14),
      ),
      child: TabBar(
        controller: tabController,
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: Colors.white,
        unselectedLabelColor:
        Colors.white.withOpacity(0.5),
        labelStyle: GoogleFonts.tajawal(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        indicator: BoxDecoration(
          color: context.primarySwatch,
          borderRadius: BorderRadius.circular(12),
        ),
        tabs: const [
          Tab(text: 'Login'),
          Tab(text: 'Sign Up'),
        ],
      ),
    );
  }
}