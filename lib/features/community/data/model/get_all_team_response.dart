

import '../../../../common/models/team_model.dart';

GetAllTeamResponse getAllTeamResponseFromJson( str) => GetAllTeamResponse.fromJson(str);


class GetAllTeamResponse {
  final List<TeamModel>? data;


  GetAllTeamResponse({
    this.data,

  });

  GetAllTeamResponse copyWith({
    List<TeamModel>? data,

  }) =>
      GetAllTeamResponse(
        data: data ?? this.data,

      );

  factory GetAllTeamResponse.fromJson(Map<String, dynamic> json) => GetAllTeamResponse(
    data: json["data"] == null ? [] : List<TeamModel>.from(json["data"]!.map((x) => TeamModel.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),

  };
}


