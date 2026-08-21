import 'dart:developer';

import '../../common/extensions/extensions.dart';
import '../../common/helper/helper.dart';

class ApiVariables {
  ApiVariables._();
  static const scheme = 'https';
  static const host = "";

  static Uri _mainUri({
    required String path,
    QueryParams? queryParameters,
  }) {
    final uri = Uri(
      scheme: scheme,
      host: host,
      path: 'api/$path',
      queryParameters: queryParameters,
    );
    log(uri.toString().logMagenta);
    return uri;
  }
}
