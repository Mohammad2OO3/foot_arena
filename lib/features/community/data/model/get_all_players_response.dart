import 'package:footarena/common/models/user_model.dart';

GetAllPlayersResponse getAllPlayersResponseFromJson(str) =>
    GetAllPlayersResponse.fromJson(str);

class GetAllPlayersResponse {
  final List<UserModel>? data;

  GetAllPlayersResponse({this.data});

  GetAllPlayersResponse copyWith({List<UserModel>? data}) =>
      GetAllPlayersResponse(data: data ?? this.data);

  factory GetAllPlayersResponse.fromJson(Map<String, dynamic> json) =>
      GetAllPlayersResponse(
        data: json["data"] == null
            ? []
            : List<UserModel>.from(
                json["data"]!.map((x) => UserModel.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}
