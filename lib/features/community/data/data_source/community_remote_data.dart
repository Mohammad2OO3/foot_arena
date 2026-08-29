import 'package:injectable/injectable.dart';
import '../../../../common/helper/src/typedef.dart';
import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/dio/api_client.dart';
import '../../../../core/unified_api/error/api_handeler_manager.dart';
import '../../domin/use_cases/transfer_team_use_case.dart';
import '../model/challenge_response.dart';
import '../model/get_all_challenge_response.dart';
import '../model/get_all_request_to_team_response.dart';
import '../model/get_all_team_response.dart';
import '../model/get_my_team_response.dart';
import '../model/request_to_team_response.dart';

@lazySingleton
class CommunityRemoteData with HandlingApiManager {
  final ApiClient _apiClient;

  CommunityRemoteData({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<GetAllTeamResponse> getAllTeam() async => wrapHandlingApi(
    tryCall: () => _apiClient.get(ApiVariables.getAllTeam()),
    jsonConvert: getAllTeamResponseFromJson,
  );

  Future<GetMyTeamResponse> getTeamDetails(int id) async => wrapHandlingApi(
    tryCall: () => _apiClient.get(ApiVariables.getTeamDetails(id)),
    jsonConvert: getMyTeamResponseFromJson,
  );

  Future<GetMyTeamResponse> getMyTeam() async => wrapHandlingApi(
    tryCall: () => _apiClient.get(ApiVariables.getMyTeam()),
    jsonConvert: getMyTeamResponseFromJson,
  );

  Future<GetMyTeamResponse> addTeam(BodyMap bodyMap) async => wrapHandlingApi(
    tryCall: () => _apiClient.post(ApiVariables.getMyTeam(), data: bodyMap),
    jsonConvert: getMyTeamResponseFromJson,
  );

  Future<GetMyTeamResponse> transferTeam(TransferTeamParams params) async =>
      wrapHandlingApi(
        tryCall: () => _apiClient.post(
          ApiVariables.transferTeamDetails(params.teamId),
          data: params.getBody(),
        ),
        jsonConvert: getMyTeamResponseFromJson,
      );


  //////////////////////////////


  Future<GetAllRequestToTeamResponse> getAllRequestToJoint(int id) async =>
      wrapHandlingApi(
        tryCall: () => _apiClient.get(ApiVariables.getAllRequestToJoint(id)),
        jsonConvert: getAllRequestToTeamResponseFromJson,
      );

  Future<RequestToTeamResponse> requestToJoint(int id) async => wrapHandlingApi(
    tryCall: () => _apiClient.post(ApiVariables.requestToJoint(id)),
    jsonConvert: requestToTeamResponseFromJson,
  );

  Future<RequestToTeamResponse> acceptRequestToJoint(int id) async =>
      wrapHandlingApi(
        tryCall: () => _apiClient.post(ApiVariables.acceptRequestToJoint(id)),
        jsonConvert: requestToTeamResponseFromJson,
      );

  Future<RequestToTeamResponse> rejectRequestToJoint(int id) async =>
      wrapHandlingApi(
        tryCall: () => _apiClient.post(ApiVariables.rejectRequestToJoint(id)),
        jsonConvert: requestToTeamResponseFromJson,
      );


  //////////////////////////////

  Future<GetAllChallengeResponse> getAllChallenge() async => wrapHandlingApi(
    tryCall: () => _apiClient.get(ApiVariables.getAllChallenge()),
    jsonConvert: getAllChallengeResponseFromJson,
  );

  Future<ChallengeResponse> getChallengeDetails(int id) async =>
      wrapHandlingApi(
        tryCall: () => _apiClient.get(ApiVariables.getChallengeDetails(id)),
        jsonConvert: challengeResponseFromJson,
      );

  Future<ChallengeResponse> addChallenge(BodyMap bodyMap) async =>
      wrapHandlingApi(
        tryCall: () =>
            _apiClient.post(ApiVariables.addChallenge(), data: bodyMap),
        jsonConvert: challengeResponseFromJson,
      );

  Future<ChallengeResponse> acceptChallenge(int id) async => wrapHandlingApi(
    tryCall: () => _apiClient.post(ApiVariables.acceptChallenge(id)),
    jsonConvert: challengeResponseFromJson,
  );

  Future<ChallengeResponse> cancelChallenge(int id) async => wrapHandlingApi(
    tryCall: () => _apiClient.post(ApiVariables.cancelChallenge(id)),
    jsonConvert: challengeResponseFromJson,
  );

  Future<ChallengeResponse> rejectChallenge(int id) async => wrapHandlingApi(
    tryCall: () => _apiClient.post(ApiVariables.rejectChallenge(id)),
    jsonConvert: challengeResponseFromJson,
  );
}
