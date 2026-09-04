// import 'package:injectable/injectable.dart';
//
// import '../models/user_match_model.dart';
// import '../models/user_response.dart';
// import '../models/user_team_model.dart';
//
// abstract class ProfileRemoteDataSource {
//   Future<UserProfileModel> getUserProfile();
//   Future<List<UserMatchModel>> getUserMatches();
//   Future<List<UserTeamModel>> getUserTeams();
// }
// @LazySingleton(as: ProfileRemoteDataSource)
// class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
//   // هنا يتم ربط الـ ApiClient الخاص بـ Laravel
//   @override
//   Future<UserProfileModel> getUserProfile() async {
//     // Dummy data للتجربة مباشرة
//     return const UserProfileModel(
//       id: '1',
//       name: 'Alex Thompson',
//       position: 'Midfielder',
//       matchesCount: 45,
//       teamsCount: 3,
//       age: 28,
//       height: 180,
//       weight: 75,
//       experienceYears: 10,
//     );
//   }
//
//   @override
//   Future<List<UserMatchModel>> getUserMatches() async {
//     return const [
//       UserMatchModel(id: '1', title: 'Arena Verde', date: 'Apr 20, 2026', status: 'Won 3-2', isWon: true),
//       UserMatchModel(id: '2', title: 'Stadium Pro', date: 'Apr 27, 2026', status: 'Upcoming', isWon: false),
//       UserMatchModel(id: '3', title: 'Green Valley', date: 'May 1, 2026', status: 'Upcoming', isWon: false),
//     ];
//   }
//
//   @override
//   Future<List<UserTeamModel>> getUserTeams() async {
//     return const [
//       UserTeamModel(id: '1', name: 'Thunder FC'),
//       UserTeamModel(id: '2', name: 'Phoenix United'),
//       UserTeamModel(id: '3', name: 'Eagles SC'),
//     ];
//   }
// }
import 'package:dio/dio.dart';
import 'package:footarena/common/helper/helper.dart';
import 'package:footarena/features/profile/data/models/user_response.dart';
import '../../../../common/helper/src/app_varibles.dart';
import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/dio/api_client.dart';
import '../../../../core/unified_api/error/api_handeler_manager.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProfileRemoteDataSource with HandlingApiManager {
  final ApiClient _apiClient;

  ProfileRemoteDataSource({required ApiClient apiClient})
    : _apiClient = apiClient;

  Future<UserResponse> getProfile() async => wrapHandlingApi(
    tryCall: () => _apiClient.get(ApiVariables.getProfile()),
    jsonConvert: userResponseFromJson,
  );
  Future<UserResponse> editProfile(BodyMap bodyMap) async => wrapHandlingApi(
    tryCall: () => _apiClient.patch(ApiVariables.getProfile(),data: bodyMap),
    jsonConvert: userResponseFromJson,
  );
}
