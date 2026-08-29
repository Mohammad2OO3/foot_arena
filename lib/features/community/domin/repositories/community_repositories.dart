import 'package:footarena/features/community/data/model/challenge_response.dart';
import 'package:footarena/features/community/data/model/get_all_challenge_response.dart';
import 'package:footarena/features/community/data/model/get_all_team_response.dart';
import 'package:footarena/features/community/data/model/get_my_team_response.dart';
import '../../../../common/helper/src/typedef.dart';
import '../../data/model/get_all_request_to_team_response.dart';
import '../../data/model/request_to_team_response.dart';
import '../use_cases/transfer_team_use_case.dart';

abstract class CommunityRepositories {

  DataResponse<GetAllTeamResponse> getAllTeam();
  DataResponse<GetMyTeamResponse> getTeamDetails(int id);
  DataResponse<GetMyTeamResponse> getMyTeam();
  DataResponse<GetMyTeamResponse> addTeam(BodyMap bodyMap);
  DataResponse<GetMyTeamResponse> transferTeam(TransferTeamParams params);
  /////////////////////////////////////////////////////////

  DataResponse<GetAllRequestToTeamResponse> getAllRequestToJoint(int id);
  DataResponse<RequestToTeamResponse> requestToJoint(int id);
  DataResponse<RequestToTeamResponse> acceptRequestToJoint(int id);
  DataResponse<RequestToTeamResponse> rejectRequestToJoint(int id);

  ////////////////////////////////////////////

  DataResponse<GetAllChallengeResponse> getAllChallenge();
  DataResponse<ChallengeResponse> getChallengeDetails(int id);
  DataResponse<ChallengeResponse> addChallenge(BodyMap bpyMap);
  DataResponse<ChallengeResponse> acceptChallenge(int id);
  DataResponse<ChallengeResponse> cancelChallenge(int id);
  DataResponse<ChallengeResponse> rejectChallenge(int id);




}
