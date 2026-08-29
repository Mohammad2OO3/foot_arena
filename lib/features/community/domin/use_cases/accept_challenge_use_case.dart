import 'package:footarena/features/community/data/model/challenge_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../common/helper/src/typedef.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/community_repositories.dart';

@lazySingleton
class AcceptChallengeUseCase
    implements UseCase<ChallengeResponse, int> {
  final CommunityRepositories _repositories;

  AcceptChallengeUseCase({required CommunityRepositories repositories})
      : _repositories = repositories;

  @override
  DataResponse<ChallengeResponse> call(int id) async =>
      await _repositories.acceptChallenge(id);
}

// class GetAllFieldSlotParams with Params {
//   final String date;
//   final int field;
//
//   GetAllFieldSlotParams({required this.date, required this.field});
//
//
//   @override
//   QueryParams getParams() {
//     // TODO: implement getParams
//     return {
//       'field': field.toString(),
//       'date': date,
//
//     }..removeWhere(
//           (key, value) => value == null || value == '' || value == 'null',
//     );
//   }
// }

