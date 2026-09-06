class NotificationModel {
  final String? id;
  final dynamic readAt;
  final DateTime? createdAt;
  final ItemData? data;

  NotificationModel({
    this.id,
    this.readAt,
    this.createdAt,
    this.data,
  });

  NotificationModel copyWith({
    String? id,
    dynamic readAt,
    DateTime? createdAt,
    ItemData? data,
  }) =>
      NotificationModel(
        id: id ?? this.id,
        readAt: readAt ?? this.readAt,
        createdAt: createdAt ?? this.createdAt,
        data: data ?? this.data,
      );

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"],
    readAt: json["read_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    data: json["data"] == null ? null : ItemData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "read_at": readAt,
    "created_at": createdAt?.toIso8601String(),
    "data": data?.toJson(),
  };
}

class ItemData {
  final String? title;
  final String? body;
  final String? type;
  final List<dynamic>? meta;

  ItemData({
    this.title,
    this.body,
    this.type,
    this.meta,
  });

  ItemData copyWith({
    String? title,
    String? body,
    String? type,
    List<dynamic>? meta,
  }) =>
      ItemData(
        title: title ?? this.title,
        body: body ?? this.body,
        type: type ?? this.type,
        meta: meta ?? this.meta,
      );

  factory ItemData.fromJson(Map<String, dynamic> json) => ItemData(
    title: json["title"],
    body: json["body"],
    type: json["type"],
    meta: json["meta"] == null ? [] : List<dynamic>.from(json["meta"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
    "type": type,
    "meta": meta == null ? [] : List<dynamic>.from(meta!.map((x) => x)),
  };
}
