import 'package:footarena/common/models/team_model.dart';
import 'package:footarena/common/models/user_model.dart';

class RequestToJointTeamModel {
  final int? id;
  final TeamModel? team;
  final UserModel? user;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  RequestToJointTeamModel({
    this.id,
    this.team,
    this.user,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  RequestToJointTeamModel copyWith({
    int? id,
    TeamModel? team,
    UserModel? user,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) => RequestToJointTeamModel(
    id: id ?? this.id,
    team: team ?? this.team,
    user: user ?? this.user,
    status: status ?? this.status,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  factory RequestToJointTeamModel.fromJson(Map<String, dynamic> json) => RequestToJointTeamModel(
    id: json["id"],
    team: json["team"] == null ? null : TeamModel.fromJson(json["team"]),
    user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "team": team?.toJson(),
    "user": user?.toJson(),
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
