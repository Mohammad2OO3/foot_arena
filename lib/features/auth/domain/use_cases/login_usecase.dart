import '../../data/models/auth_response.dart';
import '../../data/repositories/auth_repo_impl.dart';

class LoginUseCase {
  final AuthRepository repo;

  LoginUseCase(this.repo);

  Future<User> call(String email, String password) {
    return repo.login(email, password);
  }
}