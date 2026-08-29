
import 'package:footarena/common/models/challenge_model.dart';

GetAllChallengeResponse getAllChallengeResponseFromJson( str) => GetAllChallengeResponse.fromJson(str);


class GetAllChallengeResponse {
  final List<ChallengeModel>? data;


  GetAllChallengeResponse({
    this.data,

  });

  GetAllChallengeResponse copyWith({
    List<ChallengeModel>? data,

  }) =>
      GetAllChallengeResponse(
        data: data ?? this.data,

      );

  factory GetAllChallengeResponse.fromJson(Map<String, dynamic> json) => GetAllChallengeResponse(
    data: json["data"] == null ? [] : List<ChallengeModel>.from(json["data"]!.map((x) => ChallengeModel.fromJson(x))),

  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),

  };
}




