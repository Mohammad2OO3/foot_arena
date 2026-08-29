import 'package:injectable/injectable.dart';
import '../../../../common/helper/src/typedef.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/get_my_team_response.dart';
import '../repositories/community_repositories.dart';

@lazySingleton
class GetTeamDetailsUseCase
    implements UseCase<GetMyTeamResponse, int> {
  final CommunityRepositories _repositories;

  GetTeamDetailsUseCase({required CommunityRepositories repositories})
    : _repositories = repositories;

  @override
  DataResponse<GetMyTeamResponse> call(int id) async =>
      await _repositories.getTeamDetails(id);
}
