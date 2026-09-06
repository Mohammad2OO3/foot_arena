import 'package:footarena/features/community/data/model/get_all_players_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../common/helper/src/typedef.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/community_repositories.dart';

@lazySingleton
class GetAllPlayersUseCase
    implements UseCase<GetAllPlayersResponse, NoParams> {
  final CommunityRepositories _repositories;

  GetAllPlayersUseCase({required CommunityRepositories repositories})
      : _repositories = repositories;

  @override
  DataResponse<GetAllPlayersResponse> call(NoParams params) async =>
      await _repositories.getAllPlayers();
}


