part of 'notification_bloc.dart';

sealed class NotificationEvent {}

class GetAllNotificationEvent extends NotificationEvent with EventWithReload {
  @override
  final bool isReload;

  GetAllNotificationEvent({this.isReload = false});
}

class GetMarkNotificationEvent extends NotificationEvent {}

class ConfirmExtraEvent extends NotificationEvent {
  final int id;

  ConfirmExtraEvent({required this.id});
}


class RejectExtraEvent extends NotificationEvent {
  final int id;

  RejectExtraEvent({required this.id});
}

class ResetRejectExtraEvent extends NotificationEvent {}
class ResetConfirmExtraEvent extends NotificationEvent {}
