import 'package:injectable/injectable.dart';
import '../../../../common/helper/src/typedef.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/get_my_team_response.dart';
import '../repositories/community_repositories.dart';

@lazySingleton
class AddTeamUseCase
    implements UseCase<GetMyTeamResponse, AddTeamParams> {
  final CommunityRepositories _repositories;

  AddTeamUseCase({required CommunityRepositories repositories})
      : _repositories = repositories;

  @override
  DataResponse<GetMyTeamResponse> call(AddTeamParams params) async =>
      await _repositories.addTeam(params.getBody());
}


class AddTeamParams with Params {
  final String name;
  final String description;

  AddTeamParams({required this.name, required this.description});



  @override
  QueryParams getBody() {
    return {
      "name": name,
      "description": description
    }..removeWhere(
          (key, value) => value == null || value == '' || value == 'null',
    );
  }
}

