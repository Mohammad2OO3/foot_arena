import 'package:injectable/injectable.dart';

import '../../domain/repositories/profile_repository.dart';
import '../data_sources/profile_remote_data_source.dart';
import '../models/user_match_model.dart';
import '../models/user_profile_model.dart';
import '../models/user_team_model.dart';
@LazySingleton(as : ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<UserProfileModel> getUserProfile() => remoteDataSource.getUserProfile();

  @override
  Future<List<UserMatchModel>> getUserMatches() => remoteDataSource.getUserMatches();

  @override
  Future<List<UserTeamModel>> getUserTeams() => remoteDataSource.getUserTeams();
}