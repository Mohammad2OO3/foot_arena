part of 'auth_bloc.dart';

class AuthState {
  final DataStateModel<AuthResponse?> loginData;
  final DataStateModel<void> logOutData;
  final DataStateModel<void> signData;

  AuthState({
    this.loginData = const DataStateModel.setDefultValue(defultValue: null),
    this.logOutData = const DataStateModel.setDefultValue(defultValue: null),
    this.signData = const DataStateModel.setDefultValue(defultValue: null),
  });

  AuthState copyWith({
    DataStateModel<AuthResponse?>? loginData,
    DataStateModel<void>? signData,
    DataStateModel<void>? logOutData,
  }) {
    return AuthState(
      loginData: loginData ?? this.loginData,
      signData: signData ?? this.signData,
      logOutData: logOutData ?? this.logOutData,
    );
  }
}
