import 'package:injectable/injectable.dart';
import '../../../../common/helper/src/typedef.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/get_all_team_response.dart';
import '../repositories/community_repositories.dart';

@lazySingleton
class GetAllTeamUseCase
    implements UseCase<GetAllTeamResponse, NoParams> {
  final CommunityRepositories _repositories;

  GetAllTeamUseCase({required CommunityRepositories repositories})
      : _repositories = repositories;

  @override
  DataResponse<GetAllTeamResponse> call(NoParams params) async =>
      await _repositories.getAllTeam();
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

