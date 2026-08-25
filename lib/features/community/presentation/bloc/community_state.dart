part of 'community_bloc.dart';

enum CommunityTab { matches, players, teams }

class CommunityState {
  final CommunityTab selectedTab;

  const CommunityState({this.selectedTab = CommunityTab.matches});

  CommunityState copyWith({CommunityTab? selectedTab}) {
    return CommunityState(
      selectedTab: selectedTab ?? this.selectedTab,
    );
  }
}