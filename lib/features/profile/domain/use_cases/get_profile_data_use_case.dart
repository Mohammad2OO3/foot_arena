import 'package:injectable/injectable.dart';

import '../../data/models/user_match_model.dart';
import '../../data/models/user_profile_model.dart';
import '../../data/models/user_team_model.dart';
import '../repositories/profile_repository.dart';

class ProfileDataResult {
  final UserProfileModel profile;
  final List<UserMatchModel> matches;
  final List<UserTeamModel> teams;

  ProfileDataResult({
    required this.profile,
    required this.matches,
    required this.teams,
  });
}
@lazySingleton
class GetProfileDataUseCase {
  final ProfileRepository repository;

  GetProfileDataUseCase(this.repository);

  Future<ProfileDataResult> call() async {
    final profile = await repository.getUserProfile();
    final matches = await repository.getUserMatches();
    final teams = await repository.getUserTeams();

    return ProfileDataResult(
      profile: profile,
      matches: matches,
      teams: teams,
    );
  }
}