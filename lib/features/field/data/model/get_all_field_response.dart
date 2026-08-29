
import '../../../../common/models/field_model.dart';

GetAllFieldResponse getAllFieldResponseFromJson( str) => GetAllFieldResponse.fromJson(str);


class GetAllFieldResponse {
  final List<FieldModel>? data;


  GetAllFieldResponse({
    this.data,

  });

  GetAllFieldResponse copyWith({
    List<FieldModel>? data,

  }) =>
      GetAllFieldResponse(
        data: data ?? this.data,

      );

  factory GetAllFieldResponse.fromJson(Map<String, dynamic> json) => GetAllFieldResponse(
    data: json["data"] == null ? [] : List<FieldModel>.from(json["data"]!.map((x) => FieldModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}




