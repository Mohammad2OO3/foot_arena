import 'package:bloc/bloc.dart';
import 'package:footarena/features/auth/domain/use_cases/complete_profile_usecase.dart';
import 'package:footarena/features/auth/domain/use_cases/login_usecase.dart';
import 'package:footarena/features/auth/domain/use_cases/signup_usecase.dart';

import '../../data/models/auth_response.dart';


part 'auth_event.dart';
part 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;
  final CompleteProfileUseCase completeProfileUseCase;

  AuthBloc({
    required this.loginUseCase,
    required this.signupUseCase,
    required this.completeProfileUseCase,
  }) : super(AuthInitial()) {

    on<LoginRequested>(_login);
    on<SignupRequested>(_signup);
    on<CompleteProfileRequested>(_completeProfile);
  }

  Future<void> _login(
      LoginRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());

    try {
      final user = await loginUseCase(event.email, event.password);

      emit(AuthSuccess(user));

    } catch (e) {
      emit(AuthFailure("Login failed"));
    }
  }

  Future<void> _signup(
      SignupRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());

    try {
      final user = await signupUseCase(event.email, event.password);

      emit(AuthProfileRequired(user));

    } catch (e) {
      emit(AuthFailure("Signup failed"));
    }
  }

  Future<void> _completeProfile(
      CompleteProfileRequested event,
      Emitter<AuthState> emit,
      ) async {
    emit(AuthLoading());

    try {
      final user = await completeProfileUseCase(event.user);

      emit(AuthSuccess(user));

    } catch (e) {
      emit(AuthFailure("Profile update failed"));
    }
  }
}