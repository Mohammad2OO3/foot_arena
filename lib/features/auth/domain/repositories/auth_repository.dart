import 'package:footarena/features/auth/data/models/auth_response.dart';

import '../../../../common/helper/src/typedef.dart';

abstract class AuthRepository {
  DataResponse<AuthResponse> login(BodyMap bodyMap);
  DataResponse<AuthResponse> signup(BodyMap bodyMap);
  DataResponse<void> logOut();

}