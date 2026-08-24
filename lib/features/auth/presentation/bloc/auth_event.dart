part of 'auth_bloc.dart';

sealed class AuthEvent {}


class   LoginEvent extends AuthEvent{
  final LoginParams params;
  LoginEvent({required this.params});
}
class   SignupEvent extends AuthEvent {

  final SignUpParams params;

  SignupEvent({required this.params});

}
class   LogOutEvent extends AuthEvent{}



