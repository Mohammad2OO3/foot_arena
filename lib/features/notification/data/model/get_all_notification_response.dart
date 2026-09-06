import '../../../../common/models/notification_model.dart';

GetAllNotificationResponse getAllNotificationResponseFromJson(str) =>
    GetAllNotificationResponse.fromJson(str);

class GetAllNotificationResponse {
  final List<NotificationModel>? data;


  GetAllNotificationResponse({this.data});

  GetAllNotificationResponse copyWith({
    List<NotificationModel>? data,

  }) => GetAllNotificationResponse(
    data: data ?? this.data,

  );

  factory GetAllNotificationResponse.fromJson(Map<String, dynamic> json) =>
      GetAllNotificationResponse(
        data:
            json["data"] == null
                ? []
                : List<NotificationModel>.from(
                  json["data"]!.map((x) => NotificationModel.fromJson(x)),
                ),

      );

  Map<String, dynamic> toJson() => {
    "data":
        data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),

  };
}
