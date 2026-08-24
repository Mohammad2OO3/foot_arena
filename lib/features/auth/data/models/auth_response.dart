import '../../../../common/models/user_model.dart';

AuthResponse authResponseFromJson(str) => AuthResponse.fromJson(str);

class AuthResponse {
  final Data? data;

  AuthResponse({this.data});

  AuthResponse copyWith({Data? data}) => AuthResponse(data: data ?? this.data);

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {"data": data?.toJson()};
}

class Data {
  final UserModel? user;
  final String? token;

  Data({this.user, this.token});

  Data copyWith({UserModel? user, String? token}) =>
      Data(user: user ?? this.user, token: token ?? this.token);

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {"user": user?.toJson(), "token": token};
}
