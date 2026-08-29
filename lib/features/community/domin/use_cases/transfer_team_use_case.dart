import 'package:injectable/injectable.dart';
import '../../../../common/helper/src/typedef.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/get_my_team_response.dart';
import '../repositories/community_repositories.dart';

@lazySingleton
class TransferTeamUseCase
    implements UseCase<GetMyTeamResponse, TransferTeamParams> {
  final CommunityRepositories _repositories;

  TransferTeamUseCase({required CommunityRepositories repositories})
      : _repositories = repositories;

  @override
  DataResponse<GetMyTeamResponse> call(TransferTeamParams params) async =>
      await _repositories.transferTeam(params);
}


class TransferTeamParams with Params {
  final int userId;
  final int teamId;

  TransferTeamParams({required this.userId, required this.teamId});




  @override
  QueryParams getParams() {
    return {
      "user_id": userId.toString()
    }..removeWhere(
          (key, value) => value == null || value == '' || value == 'null',
    );
  }
}

