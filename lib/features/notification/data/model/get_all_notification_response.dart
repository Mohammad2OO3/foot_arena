import '../../../../common/models/notification_model.dart';

GetAllNotificationResponse getAllNotificationResponseFromJson(str) =>
    GetAllNotificationResponse.fromJson(str);

class GetAllNotificationResponse {
  final List<NotificationModel>? data;
  final Links? links;
  final Meta? meta;

  GetAllNotificationResponse({this.data, this.links, this.meta});

  GetAllNotificationResponse copyWith({
    List<NotificationModel>? data,
    Links? links,
    Meta? meta,
  }) => GetAllNotificationResponse(
    data: data ?? this.data,
    links: links ?? this.links,
    meta: meta ?? this.meta,
  );

  factory GetAllNotificationResponse.fromJson(Map<String, dynamic> json) =>
      GetAllNotificationResponse(
        data:
            json["data"] == null
                ? []
                : List<NotificationModel>.from(
                  json["data"]!.map((x) => NotificationModel.fromJson(x)),
                ),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
    "data":
        data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "links": links?.toJson(),
    "meta": meta?.toJson(),
  };
}
