import '../../data/models/auth_response.dart';
import '../../data/repositories/auth_repo_impl.dart';

class CompleteProfileUseCase {
  final AuthRepository repo;

  CompleteProfileUseCase(this.repo);



  Future<User> call(User user) {
    return repo.completeProfile(user);
  }
}