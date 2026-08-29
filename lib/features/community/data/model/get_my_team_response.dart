

import 'package:footarena/common/models/team_model.dart';

GetMyTeamResponse getMyTeamResponseFromJson( str) => GetMyTeamResponse.fromJson(str);


class GetMyTeamResponse {
  final TeamModel? data;

  GetMyTeamResponse({
    this.data,
  });

  GetMyTeamResponse copyWith({
    TeamModel? data,
  }) =>
      GetMyTeamResponse(
        data: data ?? this.data,
      );

  factory GetMyTeamResponse.fromJson(Map<String, dynamic> json) => GetMyTeamResponse(
    data: json["data"] == null ? null : TeamModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

