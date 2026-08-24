import '../../../../common/helper/src/typedef.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/auth_repository.dart';

@lazySingleton
class LogOutUseCase implements UseCase<void, NoParams> {
  final AuthRepository _authRepositories;

  LogOutUseCase({required AuthRepository authRepositories})
    : _authRepositories = authRepositories;

  @override
  DataResponse<void> call(NoParams params) async =>
      await _authRepositories.logOut();
}
