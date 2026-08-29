

import 'package:footarena/common/models/request_to_join_team_model.dart';

RequestToTeamResponse requestToTeamResponseFromJson( str) => RequestToTeamResponse.fromJson(str);


class RequestToTeamResponse {
  final RequestToJointTeamModel? data;

  RequestToTeamResponse({
    this.data,
  });

  RequestToTeamResponse copyWith({
    RequestToJointTeamModel? data,
  }) =>
      RequestToTeamResponse(
        data: data ?? this.data,
      );

  factory RequestToTeamResponse.fromJson(Map<String, dynamic> json) => RequestToTeamResponse(
    data: json["data"] == null ? null : RequestToJointTeamModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}


