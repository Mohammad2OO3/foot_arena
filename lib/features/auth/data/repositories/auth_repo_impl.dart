import '../../../../common/helper/src/typedef.dart';
import '../../../../core/unified_api/error/error_handeler.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/remote_auth_data_source.dart';
import '../models/auth_response.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoriesImp with HandlingException implements AuthRepository {
  final AuthRemoteData _remoteData;

  AuthRepositoriesImp({required AuthRemoteData remoteData}) : _remoteData = remoteData;



  @override
  DataResponse<AuthResponse> login(BodyMap bodyMap) async {
    return wrapHandlingException(tryCall: () => _remoteData.logIn(bodyMap));
  }

  @override
  DataResponse<AuthResponse> signup(BodyMap bodyMap)async {
    return wrapHandlingException(tryCall: () => _remoteData.signUp(bodyMap));
  }





  @override
  DataResponse<void> logOut() async =>
      wrapHandlingException(tryCall: () => _remoteData.logOut());



}
