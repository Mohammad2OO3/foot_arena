import '../../../../common/helper/src/typedef.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/auth_response.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class LoginUseCase implements UseCase<AuthResponse, LoginParams> {
  final AuthRepository _authRepositories;

  LoginUseCase({required AuthRepository authRepositories})
      : _authRepositories = authRepositories;

  @override
  DataResponse<AuthResponse> call(LoginParams params) async =>
      await _authRepositories.login(params.getBody());
}

class LoginParams with Params {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});

  @override
  BodyMap getBody() {
    // TODO: implement getBody
    return {"email": email, "password": password}
      ..removeWhere((key, value) => value == null);
  }
}
