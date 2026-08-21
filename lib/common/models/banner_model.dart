
class BannerModel {
  final int? id;
  final String? title;
  final Image? image;
  final String? linkUrl;
  final int? order;

  BannerModel({
    this.id,
    this.title,
    this.image,
    this.linkUrl,
    this.order,
  });

  BannerModel copyWith({
    int? id,
    String? title,
    Image? image,
    String? linkUrl,
    int? order,
  }) =>
      BannerModel(
        id: id ?? this.id,
        title: title ?? this.title,
        image: image ?? this.image,
        linkUrl: linkUrl ?? this.linkUrl,
        order: order ?? this.order,
      );

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json["id"],
    title: json["title"],
    image: json["image"] == null ? null : Image.fromJson(json["image"]),
    linkUrl: json["linkUrl"],
    order: json["order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image?.toJson(),
    "linkUrl": linkUrl,
    "order": order,
  };
}

class Image {
  final int? id;
  final String? fileName;
  final String? url;
  final int? size;
  final String? mimeType;
  final DateTime? createdAt;

  Image({
    this.id,
    this.fileName,
    this.url,
    this.size,
    this.mimeType,
    this.createdAt,
  });

  Image copyWith({
    int? id,
    String? fileName,
    String? url,
    int? size,
    String? mimeType,
    DateTime? createdAt,
  }) =>
      Image(
        id: id ?? this.id,
        fileName: fileName ?? this.fileName,
        url: url ?? this.url,
        size: size ?? this.size,
        mimeType: mimeType ?? this.mimeType,
        createdAt: createdAt ?? this.createdAt,
      );

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    fileName: json["fileName"],
    url: json["url"],
    size: json["size"],
    mimeType: json["mimeType"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fileName": fileName,
    "url": url,
    "size": size,
    "mimeType": mimeType,
    "createdAt": createdAt?.toIso8601String(),
  };
}
