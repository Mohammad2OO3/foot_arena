part of 'community_bloc.dart';

abstract class CommunityEvent {
  const CommunityEvent();
}

class ChangeTabEvent extends CommunityEvent {
  final CommunityTab selectedTab;

  const ChangeTabEvent(this.selectedTab);
}