import '../../../../common/helper/src/typedef.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/user_response.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class EditProfileDataUseCase
    implements UseCase<UserResponse, EditProfileDataParams> {
  final ProfileRepository _profileRepository;

  EditProfileDataUseCase({required ProfileRepository profileRepository})
    : _profileRepository = profileRepository;

  @override
  DataResponse<UserResponse> call(EditProfileDataParams params) async =>
      await _profileRepository.editUserProfile(params.getBody());
}

class EditProfileDataParams with Params {
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? position;
  final int? age;
  final int? height;
  final int? weight;
  final int? experienceYears;

  EditProfileDataParams({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.position,
    required this.age,
    required this.height,
    required this.weight,
    required this.experienceYears,
  });

  @override
  BodyMap getBody() {
    return {
      "first_name": firstName,
      "last_name": lastName,
      "email": email,
      "phone": phone,
      "age": age,
      "height": height,
      "weight": weight,
      "experience_years": experienceYears,
      "position": position,
    }..removeWhere((key, value) => value == null);
  }
}
