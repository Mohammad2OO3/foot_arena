import 'package:footarena/common/helper/src/typedef.dart';
import 'package:footarena/features/profile/data/models/user_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/unified_api/error/error_handeler.dart';
import '../../domain/repositories/profile_repository.dart';
import '../data_sources/profile_remote_data_source.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl
    with HandlingException
    implements ProfileRepository {
  final ProfileRemoteDataSource _remoteData;

  ProfileRepositoryImpl({required ProfileRemoteDataSource remoteData})
    : _remoteData = remoteData;

  @override
  DataResponse<UserResponse> getUserProfile() async {
    return wrapHandlingException(tryCall: () => _remoteData.getProfile());
  }

  // @override
  // Future<UserProfileModel> getUserProfile() => remoteDataSource.getUserProfile();
  //
  // @override
  // Future<List<UserMatchModel>> getUserMatches() => remoteDataSource.getUserMatches();
  //
  // @override
  // Future<List<UserTeamModel>> getUserTeams() => remoteDataSource.getUserTeams();
}
