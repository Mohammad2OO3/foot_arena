import '../models/auth_response.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
  Future<User> signup(String email, String password);
  Future<User> completeProfile(User user);
}