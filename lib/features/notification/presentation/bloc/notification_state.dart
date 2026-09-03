part of 'notification_bloc.dart';


class NotificationState {
  final PaginationStateModel<NotificationModel> getAllNotification;
  final DataStateModel<void> getMarkNotification;
  final DataStateModel<void> confirmExtraData;
  final DataStateModel<void> rejectExtraData;

  final bool isNew;

  const NotificationState({
    this.getAllNotification = const PaginationStateModel(perPage: 10),
    this.getMarkNotification = const DataStateModel.setDefultValue(
      defultValue: null
    ),
    this.confirmExtraData = const DataStateModel.setDefultValue(
      defultValue: null
    ),
    this.rejectExtraData = const DataStateModel.setDefultValue(
      defultValue: null
    ),

    this.isNew = false,

  });

  NotificationState copyWith({
    PaginationStateModel<NotificationModel>? getAllNotification,
    DataStateModel<void>? getMarkNotification,
    DataStateModel<void>? confirmExtraData,
    DataStateModel<void>? rejectExtraData,

    bool? isNew,


  }) {
    return NotificationState(
      getAllNotification: getAllNotification ?? this.getAllNotification,
      getMarkNotification: getMarkNotification ?? this.getMarkNotification,
      isNew: isNew ?? this.isNew,
      rejectExtraData: rejectExtraData ?? this.rejectExtraData,
      confirmExtraData: confirmExtraData ?? this.confirmExtraData,

    );
  }
}
