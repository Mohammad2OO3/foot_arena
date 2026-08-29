import 'package:footarena/common/models/user_model.dart';

UserResponse userResponseFromJson(str) => UserResponse.fromJson(str);

class UserResponse {
  final UserModel? data;

  UserResponse({this.data});

  UserResponse copyWith({UserModel? data}) =>
      UserResponse(data: data ?? this.data);

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    data: json["data"] == null ? null : UserModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {"data": data?.toJson()};
}
