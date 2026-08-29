

import 'package:footarena/common/models/challenge_model.dart';

ChallengeResponse challengeResponseFromJson( str) => ChallengeResponse.fromJson(str);


class ChallengeResponse {
  final ChallengeModel? data;

  ChallengeResponse({
    this.data,
  });

  ChallengeResponse copyWith({
    ChallengeModel? data,
  }) =>
      ChallengeResponse(
        data: data ?? this.data,
      );

  factory ChallengeResponse.fromJson(Map<String, dynamic> json) => ChallengeResponse(
    data: json["data"] == null ? null : ChallengeModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}
