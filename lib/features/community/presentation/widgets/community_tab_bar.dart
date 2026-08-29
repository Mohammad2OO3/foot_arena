import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/features/community/presentation/bloc/community_bloc.dart';

class CommunityTabBar extends StatelessWidget {
  final CommunityBloc _communityBloc;

  const CommunityTabBar({super.key, required CommunityBloc communityBloc})
    : _communityBloc = communityBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommunityBloc, CommunityState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E1E),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              _buildTabItem(
                context,
                "Matches",
                CommunityTab.matches,
                state.selectedTab,
              ),
              _buildTabItem(
                context,
                "Players",
                CommunityTab.players,
                state.selectedTab,
              ),
              _buildTabItem(
                context,
                "Teams",
                CommunityTab.teams,
                state.selectedTab,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabItem(
    BuildContext context,
    String label,
    CommunityTab tab,
    CommunityTab selectedTab,
  ) {
    final isSelected = selectedTab == tab;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          _communityBloc.add(ChangeTabEvent(selectedTab: tab));
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF00C853) : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
