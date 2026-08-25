import '../../data/models/user_match_model.dart';
import '../../data/models/user_profile_model.dart';
import '../../data/models/user_team_model.dart';

abstract class ProfileRepository {
  Future<UserProfileModel> getUserProfile();
  Future<List<UserMatchModel>> getUserMatches();
  Future<List<UserTeamModel>> getUserTeams();
}