import '../models/auth_response.dart';
import '../repositories/auth_repo_impl.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<User> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));

    return User(email: email, id: "1");
  }

  @override
  Future<User> signup(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 800));

    return User(email: email);
  }

  @override
  Future<User> completeProfile(User user) async {
    await Future.delayed(const Duration(milliseconds: 800));

    return user;
  }
}