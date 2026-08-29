import 'package:footarena/features/community/data/model/request_to_team_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../common/helper/src/typedef.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/community_repositories.dart';

@lazySingleton
class RequestToJoinUseCase
    implements UseCase<RequestToTeamResponse, int> {
  final CommunityRepositories _repositories;

  RequestToJoinUseCase({required CommunityRepositories repositories})
      : _repositories = repositories;

  @override
  DataResponse<RequestToTeamResponse> call(int id) async =>
      await _repositories.requestToJoint(id);
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

