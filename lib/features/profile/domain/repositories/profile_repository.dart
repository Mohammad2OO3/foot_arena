import 'package:footarena/common/helper/helper.dart';

import '../../data/models/user_match_model.dart';
import '../../data/models/user_response.dart';
import '../../data/models/user_team_model.dart';

abstract class ProfileRepository {
  DataResponse<UserResponse> getUserProfile();
  // Future<List<UserMatchModel>> getUserMatches();
  // Future<List<UserTeamModel>> getUserTeams();
}