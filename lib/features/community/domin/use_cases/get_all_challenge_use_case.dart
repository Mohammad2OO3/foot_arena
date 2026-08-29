import 'package:injectable/injectable.dart';
import '../../../../common/helper/src/typedef.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/get_all_challenge_response.dart';
import '../repositories/community_repositories.dart';

@lazySingleton
class GetAllChallengeUseCase
    implements UseCase<GetAllChallengeResponse, NoParams> {
  final CommunityRepositories _repositories;

  GetAllChallengeUseCase({required CommunityRepositories repositories})
      : _repositories = repositories;

  @override
  DataResponse<GetAllChallengeResponse> call(NoParams params) async =>
      await _repositories.getAllChallenge();
}


