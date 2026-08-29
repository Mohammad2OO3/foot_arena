part of 'community_bloc.dart';

sealed class CommunityEvent {}

class ChangeTabEvent extends CommunityEvent {
  final CommunityTab selectedTab;

  ChangeTabEvent({required this.selectedTab});
}

// Teams

class GetAllTeamEvent extends CommunityEvent {}

class GetTeamDetailsEvent extends CommunityEvent {
  final int id;

  GetTeamDetailsEvent({required this.id});
}

class GetMyTeamEvent extends CommunityEvent {}

class AddTeamEvent extends CommunityEvent {
  final AddTeamParams params;

  AddTeamEvent({required this.params});
}

class TransferTeamEvent extends CommunityEvent {
  final TransferTeamParams params;

  TransferTeamEvent({required this.params});
}

// Requests to join team

class GetAllRequestToJointEvent extends CommunityEvent {
  final int id;

  GetAllRequestToJointEvent({required this.id});
}

class RequestToJointEvent extends CommunityEvent {
  final int id;

  RequestToJointEvent({required this.id});
}

class AcceptRequestToJointEvent extends CommunityEvent {
  final int id;

  AcceptRequestToJointEvent({required this.id});
}

class RejectRequestToJointEvent extends CommunityEvent {
  final int id;

  RejectRequestToJointEvent({required this.id});
}

// Challenges

class GetAllChallengeEvent extends CommunityEvent {}

class GetChallengeDetailsEvent extends CommunityEvent {
  final int id;

  GetChallengeDetailsEvent({required this.id});
}

class AddChallengeEvent extends CommunityEvent {
  final AddChallengeParams params;

  AddChallengeEvent({required this.params});
}

class AcceptChallengeEvent extends CommunityEvent {
  final int id;

  AcceptChallengeEvent({required this.id});
}

class CancelChallengeEvent extends CommunityEvent {
  final int id;

  CancelChallengeEvent({required this.id});
}

class RejectChallengeEvent extends CommunityEvent {
  final int id;

  RejectChallengeEvent({required this.id});
}
