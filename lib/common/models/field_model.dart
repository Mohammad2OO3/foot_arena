class FieldModel {
  final int? id;
  final String? name;
  final String? location;
  final String? description;
  final String? pricePerSlot;
  final bool? indoor;
  final Features? features;
  final MainImage? mainImage;
  final List<MainImage>? gallery;
  final int? activeSlotsCount;
  final String? createdAt;
  final String? updatedAt;

  FieldModel({
    this.id,
    this.name,
    this.location,
    this.description,
    this.pricePerSlot,
    this.indoor,
    this.features,
    this.mainImage,
    this.gallery,
    this.activeSlotsCount,
    this.createdAt,
    this.updatedAt,
  });

  FieldModel copyWith({
    int? id,
    String? name,
    String? location,
    String? description,
    String? pricePerSlot,
    bool? indoor,
    Features? features,
    MainImage? mainImage,
    List<MainImage>? gallery,
    int? activeSlotsCount,
    String? createdAt,
    String? updatedAt,
  }) =>
      FieldModel(
        id: id ?? this.id,
        name: name ?? this.name,
        location: location ?? this.location,
        description: description ?? this.description,
        pricePerSlot: pricePerSlot ?? this.pricePerSlot,
        indoor: indoor ?? this.indoor,
        features: features ?? this.features,
        mainImage: mainImage ?? this.mainImage,
        gallery: gallery ?? this.gallery,
        activeSlotsCount: activeSlotsCount ?? this.activeSlotsCount,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory FieldModel.fromJson(Map<String, dynamic> json) => FieldModel(
    id: json["id"],
    name: json["name"],
    location: json["location"],
    description: json["description"],
    pricePerSlot: json["price_per_slot"],
    indoor: json["indoor"],
    features: json["features"] == null ? null : Features.fromJson(json["features"]),
    mainImage: json["main_image"] == null ? null : MainImage.fromJson(json["main_image"]),
    gallery: json["gallery"] == null ? [] : List<MainImage>.from(json["gallery"]!.map((x) => MainImage.fromJson(x))),
    activeSlotsCount: json["active_slots_count"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "location": location,
    "description": description,
    "price_per_slot": pricePerSlot,
    "indoor": indoor,
    "features": features?.toJson(),
    "main_image": mainImage?.toJson(),
    "gallery": gallery == null ? [] : List<dynamic>.from(gallery!.map((x) => x.toJson())),
    "active_slots_count": activeSlotsCount,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}

class Features {
  final bool? hasLighting;
  final bool? hasParking;
  final bool? withShowers;
  final bool? hasWater;

  Features({
    this.hasLighting,
    this.hasParking,
    this.withShowers,
    this.hasWater,
  });

  Features copyWith({
    bool? hasLighting,
    bool? hasParking,
    bool? withShowers,
    bool? hasWater,
  }) =>
      Features(
        hasLighting: hasLighting ?? this.hasLighting,
        hasParking: hasParking ?? this.hasParking,
        withShowers: withShowers ?? this.withShowers,
        hasWater: hasWater ?? this.hasWater,
      );

  factory Features.fromJson(Map<String, dynamic> json) => Features(
    hasLighting: json["has_lighting"],
    hasParking: json["has_parking"],
    withShowers: json["with_showers"],
    hasWater: json["has_water"],
  );

  Map<String, dynamic> toJson() => {
    "has_lighting": hasLighting,
    "has_parking": hasParking,
    "with_showers": withShowers,
    "has_water": hasWater,
  };
}

class MainImage {
  final int? id;
  final String? path;
  final bool? isPrimary;
  final int? sortOrder;

  MainImage({
    this.id,
    this.path,
    this.isPrimary,
    this.sortOrder,
  });

  MainImage copyWith({
    int? id,
    String? path,
    bool? isPrimary,
    int? sortOrder,
  }) =>
      MainImage(
        id: id ?? this.id,
        path: path ?? this.path,
        isPrimary: isPrimary ?? this.isPrimary,
        sortOrder: sortOrder ?? this.sortOrder,
      );

  factory MainImage.fromJson(Map<String, dynamic> json) => MainImage(
    id: json["id"],
    path: json["path"],
    isPrimary: json["is_primary"],
    sortOrder: json["sort_order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "path": path,
    "is_primary": isPrimary,
    "sort_order": sortOrder,
  };
}