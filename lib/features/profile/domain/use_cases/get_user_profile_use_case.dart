import '../../../../common/helper/src/typedef.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/user_response.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class GetUserProfileUseCase implements UseCase<UserResponse, NoParams> {
  final ProfileRepository _profileRepository;

  GetUserProfileUseCase({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository;

  @override
  DataResponse<UserResponse> call(NoParams params) async =>
      await _profileRepository.getUserProfile();
}

