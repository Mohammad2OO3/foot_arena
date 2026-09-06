import 'dart:developer';
import 'package:footarena/features/field/domin/use_cases/get_all_field_slot_use_case.dart';

import '../../common/extensions/src/log_colors_extension.dart';
import '../../common/helper/src/typedef.dart';

class ApiVariables {
  ApiVariables._();

  static const scheme = 'https';
  static const host = "foot-arena.eidosteam.com";

  static Uri _mainUri({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) {
    final uri = Uri(
      scheme: scheme,
      host: host,
      path: 'api/v1/$path',
      queryParameters: queryParameters,
    );
    log(uri.toString().logMagenta);
    return uri;
  }

  //version
  static Uri getVersion() => _mainUri(path: 'app/version/check');

  ///Auth///

  static Uri _auth({required String path}) => _mainUri(path: path);

  static Uri login() => _auth(path: "login");

  static Uri signup() => _auth(path: "register");

  static Uri getProfile() => _auth(path: "me");

  static Uri confirm() => _auth(path: "verify-email");

  static Uri forget() => _auth(path: "password/request-code");

  static Uri forgetVerify() => _auth(path: "password/verify-code");

  static Uri forgetReset() => _auth(path: "password/reset");

  static Uri logOut() => _auth(path: "logout");



  //////////////////////////////

  static Uri getAllField() => _mainUri(path: "fields");

  static Uri getFieldDetails(int id) => _mainUri(path: "fields/$id");

  static Uri getAllSlots(int id, QueryParams params) =>
      _mainUri(path: "fields/$id/slots", queryParameters: params);

  static Uri _user({required String path, QueryParams? queryParameters}) =>
      _mainUri(path: 'user/$path', queryParameters: queryParameters);

  static Uri getMe() => _user(path: "profile");

  static Uri updateMe() => _user(path: "profile");

  static Uri deleteMe() => _mainUri(path: "me");

  static Uri postProfileImage() => _user(path: "profile/avatar");

  static Uri getMinePhotos(QueryParams queryParams) =>
      _user(path: "myPhotos", queryParameters: queryParams);

  static Uri updateMyPassword() => _user(path: "updateMyPassword");
  static Uri postMessage() => _mainUri(path: "ai/message");


    //community

  static Uri getAllTeam() => _mainUri(path: "teams");
  static Uri getMyTeam() => _mainUri(path: "teams/my");
  static Uri addTeam() => _mainUri(path: "teams");
  static Uri getTeamDetails(int id) => _mainUri(path: "teams/$id");
  static Uri transferTeamDetails(int id) => _mainUri(path: "teams/$id/transfer-captaincy");
  ////
  static Uri getAllRequestToJoint(int id) => _mainUri(path: "teams/$id/join-requests");
  static Uri requestToJoint(int id) => _mainUri(path: "teams/$id/join-requests");
  static Uri acceptRequestToJoint(int id) => _mainUri(path: "team-join-requests/$id/accept");
  static Uri rejectRequestToJoint(int id) => _mainUri(path: "team-join-requests/$id/reject");
  ////
  static Uri getAllChallenge() => _mainUri(path: "challenges");
  static Uri getChallengeDetails(int id) => _mainUri(path: "challenges/$id");
  static Uri addChallenge() => _mainUri(path: "challenges");
  static Uri acceptChallenge(int id) => _mainUri(path: "challenges/$id/accept");
  static Uri rejectChallenge(int id) => _mainUri(path: "challenges/$id/reject");
  static Uri cancelChallenge(int id) => _mainUri(path: "challenges/$id/cancel");

  ////
  static Uri getAllPlayers() => _mainUri(path: "players");

 // https://foot-arena.eidosteam.com/api/v1/teams/{team}

  //////////////////////////////////////////////////////////////////////////



  ///notification

  static Uri getAllNotification(QueryParams queryParams) =>
      _mainUri(path: 'notifications', queryParameters: queryParams);

  static Uri postMarkAllNotification() =>
      _mainUri(path: 'notifications/read-all');

  static Uri deleteNotification(String id) =>
      _mainUri(path: 'user/notifications/$id');

  static Uri confirmExtra(int id) =>
      _mainUri(path: 'orders/$id/confirm-instant');

  static Uri rejectExtra(int id) =>
      _mainUri(path: 'orders/$id/reject-instant-service');
}
