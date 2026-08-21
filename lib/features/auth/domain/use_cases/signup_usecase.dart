import '../../data/models/auth_response.dart';
import '../../data/repositories/auth_repo_impl.dart';

class SignupUseCase {
  final AuthRepository repo;

  SignupUseCase(this.repo);

  Future<User> call(String email, String password) {
    return repo.signup(email, password);
  }
}