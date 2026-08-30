import 'package:footarena/common/helper/helper.dart';
import '../../data/models/user_response.dart';

abstract class ProfileRepository {
  DataResponse<UserResponse> getUserProfile();
  DataResponse<UserResponse> editUserProfile(BodyMap bodyMap);
  // Future<List<UserMatchModel>> getUserMatches();
  // Future<List<UserTeamModel>> getUserTeams();
}