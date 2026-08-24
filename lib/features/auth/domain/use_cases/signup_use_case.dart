import '../../../../common/helper/src/typedef.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/auth_response.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class SignupUseCase implements UseCase<AuthResponse, SignUpParams> {
  final AuthRepository _authRepositories;

  SignupUseCase({required AuthRepository authRepositories})
    : _authRepositories = authRepositories;

  @override
  DataResponse<AuthResponse> call(SignUpParams params) async =>
      await _authRepositories.signup(params.getBody());
}

class SignUpParams with Params {
  final String? email;
  final String? password;
  final String? confirmPassword;
  final String? firstName;
  final String? lastName;
  final String? phone;
  final String? position;
  final int? age;
  final int? height;
  final int? weight;
  final int? experienceYears;

  SignUpParams({
    required this.email,
    required this.password,
    required this.confirmPassword,
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
      "password": password,
      "age": age,
      "height": height,
      "weight": weight,
      "experience_years": experienceYears,
      "position": position,
      "password_confirmation": confirmPassword,
    }..removeWhere((key, value) => value == null);
  }
}
