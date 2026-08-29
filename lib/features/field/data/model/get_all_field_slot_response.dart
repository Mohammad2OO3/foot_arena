GetAllFiledSlotResponse getAllFiledSlotResponseFromJson(str) =>
    GetAllFiledSlotResponse.fromJson(str);

class GetAllFiledSlotResponse {
  final List<SlotModel>? data;

  GetAllFiledSlotResponse({this.data});

  GetAllFiledSlotResponse copyWith({List<SlotModel>? data}) =>
      GetAllFiledSlotResponse(data: data ?? this.data);

  factory GetAllFiledSlotResponse.fromJson(Map<String, dynamic> json) =>
      GetAllFiledSlotResponse(
        data: json["data"] == null
            ? []
            : List<SlotModel>.from(
                json["data"]!.map((x) => SlotModel.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SlotModel {
  final int? id;
  final int? fieldId;
  final String? startTime;
  final String? endTime;
  final bool? isActive;
  final bool? isAvailable;

  SlotModel({
    this.id,
    this.fieldId,
    this.startTime,
    this.endTime,
    this.isActive,
    this.isAvailable,
  });

  SlotModel copyWith({
    int? id,
    int? fieldId,
    String? startTime,
    String? endTime,
    bool? isActive,
    bool? isAvailable,
  }) => SlotModel(
    id: id ?? this.id,
    fieldId: fieldId ?? this.fieldId,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    isActive: isActive ?? this.isActive,
    isAvailable: isAvailable ?? this.isAvailable,
  );

  factory SlotModel.fromJson(Map<String, dynamic> json) => SlotModel(
    id: json["id"],
    fieldId: json["field_id"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    isActive: json["is_active"],
    isAvailable: json["is_available"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "field_id": fieldId,
    "start_time": startTime,
    "end_time": endTime,
    "is_active": isActive,
    "is_available": isAvailable,
  };
}
