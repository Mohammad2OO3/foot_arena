import 'package:footarena/common/models/request_to_join_team_model.dart';


GetAllRequestToTeamResponse getAllRequestToTeamResponseFromJson(str) =>
    GetAllRequestToTeamResponse.fromJson(str);

class GetAllRequestToTeamResponse {
  final List<RequestToJointTeamModel>? data;


  GetAllRequestToTeamResponse({this.data});

  GetAllRequestToTeamResponse copyWith({
    List<RequestToJointTeamModel>? data,

  }) => GetAllRequestToTeamResponse(
    data: data ?? this.data,

  );

  factory GetAllRequestToTeamResponse.fromJson(Map<String, dynamic> json) =>
      GetAllRequestToTeamResponse(
        data: json["data"] == null
            ? []
            : List<RequestToJointTeamModel>.from(json["data"]!.map((x) => RequestToJointTeamModel.fromJson(x))),

      );

  Map<String, dynamic> toJson() => {
    "data": data == null
        ? []
        : List<dynamic>.from(data!.map((x) => x.toJson())),

  };
}



