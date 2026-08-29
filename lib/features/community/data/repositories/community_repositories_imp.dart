import 'package:footarena/features/community/data/model/challenge_response.dart';
import 'package:footarena/features/community/data/model/get_all_challenge_response.dart';
import 'package:footarena/features/community/data/model/get_all_request_to_team_response.dart';
import 'package:footarena/features/community/data/model/get_all_team_response.dart';
import 'package:footarena/features/community/data/model/request_to_team_response.dart';
import 'package:footarena/features/community/domin/use_cases/transfer_team_use_case.dart';
import '../../../../common/helper/src/typedef.dart';
import '../../../../core/unified_api/error/error_handeler.dart';
import '../../domin/repositories/community_repositories.dart';
import 'package:injectable/injectable.dart';
import '../data_source/community_remote_data.dart';
import '../model/get_my_team_response.dart';

@LazySingleton(as: CommunityRepositories)
class CommunityRepositoriesImp
    with HandlingException
    implements CommunityRepositories {
  final CommunityRemoteData _remoteData;

  CommunityRepositoriesImp({required CommunityRemoteData remoteData})
    : _remoteData = remoteData;

  @override
  DataResponse<ChallengeResponse> acceptChallenge(int id) =>
      wrapHandlingException(tryCall: () => _remoteData.acceptChallenge(id));

  @override
  DataResponse<RequestToTeamResponse> acceptRequestToJoint(int id) =>
      wrapHandlingException(
        tryCall: () => _remoteData.acceptRequestToJoint(id),
      );

  @override
  DataResponse<ChallengeResponse> addChallenge(BodyMap bpyMap) =>
      wrapHandlingException(tryCall: () => _remoteData.addChallenge(bpyMap));

  @override
  DataResponse<GetMyTeamResponse> addTeam(BodyMap bodyMap) =>
      wrapHandlingException(tryCall: () => _remoteData.addTeam(bodyMap));

  @override
  DataResponse<ChallengeResponse> cancelChallenge(int id) =>
      wrapHandlingException(tryCall: () => _remoteData.cancelChallenge(id));

  @override
  DataResponse<GetAllChallengeResponse> getAllChallenge() =>
      wrapHandlingException(tryCall: () => _remoteData.getAllChallenge());

  @override
  DataResponse<GetAllRequestToTeamResponse> getAllRequestToJoint(int id) =>
      wrapHandlingException(
        tryCall: () => _remoteData.getAllRequestToJoint(id),
      );

  @override
  DataResponse<GetAllTeamResponse> getAllTeam() =>
      wrapHandlingException(tryCall: () => _remoteData.getAllTeam());

  @override
  DataResponse<ChallengeResponse> getChallengeDetails(int id) =>
      wrapHandlingException(tryCall: () => _remoteData.getChallengeDetails(id));

  @override
  DataResponse<GetMyTeamResponse> getMyTeam() =>
      wrapHandlingException(tryCall: () => _remoteData.getMyTeam());

  @override
  DataResponse<GetMyTeamResponse> getTeamDetails(int id) =>
      wrapHandlingException(tryCall: () => _remoteData.getTeamDetails(id));

  @override
  DataResponse<ChallengeResponse> rejectChallenge(int id) =>
      wrapHandlingException(tryCall: () => _remoteData.rejectChallenge(id));

  @override
  DataResponse<RequestToTeamResponse> rejectRequestToJoint(int id) =>
      wrapHandlingException(
        tryCall: () => _remoteData.rejectRequestToJoint(id),
      );

  @override
  DataResponse<RequestToTeamResponse> requestToJoint(int id) =>
      wrapHandlingException(tryCall: () => _remoteData.requestToJoint(id));

  @override
  DataResponse<GetMyTeamResponse> transferTeam(TransferTeamParams params) =>
      wrapHandlingException(tryCall: () => _remoteData.transferTeam(params));
}
