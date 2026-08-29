import 'package:injectable/injectable.dart';
import '../../../../common/helper/src/typedef.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/get_my_team_response.dart';
import '../repositories/community_repositories.dart';

@lazySingleton
class GetMyTeamUseCase
    implements UseCase<GetMyTeamResponse, NoParams> {
  final CommunityRepositories _repositories;

  GetMyTeamUseCase({required CommunityRepositories repositories})
      : _repositories = repositories;

  @override
  DataResponse<GetMyTeamResponse> call(NoParams params) async =>
      await _repositories.getMyTeam();
}



