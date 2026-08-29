import 'package:footarena/features/community/data/model/challenge_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../common/helper/src/typedef.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/community_repositories.dart';

@lazySingleton
class AddChallengeUseCase
    implements UseCase<ChallengeResponse, AddChallengeParams> {
  final CommunityRepositories _repositories;

  AddChallengeUseCase({required CommunityRepositories repositories})
    : _repositories = repositories;

  @override
  DataResponse<ChallengeResponse> call(AddChallengeParams params) async =>
      await _repositories.addChallenge(params.getBody());
}

class AddChallengeParams with Params {
  final int opponentTeamId;
  final int fieldId;
  final int fieldSlotId;
  final String matchDate;
  final String note;

  AddChallengeParams({
    required this.opponentTeamId,
    required this.fieldId,
    required this.fieldSlotId,
    required this.matchDate,
    required this.note,
  });

  @override
  QueryParams getParams() {
    // TODO: implement getParams
    return {
      "opponent_team_id": opponentTeamId.toString(),
      "field_id": fieldId.toString(),
      "field_slot_id": fieldSlotId.toString(),
      "match_date": matchDate,
      "note": note,
    }..removeWhere(
      (key, value) => value == null || value == '' || value == 'null',
    );
  }
}
