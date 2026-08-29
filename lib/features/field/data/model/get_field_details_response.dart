import '../../../../common/models/field_model.dart';

GetFieldDetailsResponse getFieldDetailsResponseFromJson(str) =>
    GetFieldDetailsResponse.fromJson(str);


class GetFieldDetailsResponse {
  final FieldModel? data;

  GetFieldDetailsResponse({
    this.data,
  });

  GetFieldDetailsResponse copyWith({
    FieldModel? data,
  }) =>
      GetFieldDetailsResponse(
        data: data ?? this.data,
      );

  factory GetFieldDetailsResponse.fromJson(Map<String, dynamic> json) =>
      GetFieldDetailsResponse(
        data: json["data"] == null ? null : FieldModel.fromJson(json["data"]),
      );


}

