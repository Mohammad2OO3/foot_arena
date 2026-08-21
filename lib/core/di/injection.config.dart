// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../common/design/src/theme/theme/theme_notifier.dart' as _i291;
import '../../common/extensions/src/image_provider.dart' as _i290;
import '../unified_api/dio/api_client.dart' as _i357;
import '../unified_api/dio/logger_interceptor.dart' as _i614;
import 'injection.dart' as _i464;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final injectableModule = _$InjectableModule();
  gh.singleton<_i361.Dio>(() => injectableModule.dio);
  gh.lazySingleton<_i291.AppThemeNotifier>(() => _i291.AppThemeNotifier());
  gh.lazySingleton<_i290.ImageProviderHelper>(
    () => _i290.ImageProviderHelper(),
  );
  gh.lazySingleton<_i614.LoggerInterceptor>(() => _i614.LoggerInterceptor());
  gh.lazySingleton<_i357.ApiClient>(
    () => _i357.ApiClient(
      gh<_i361.Dio>(),
      loggingInterceptor: gh<_i614.LoggerInterceptor>(),
    ),
  );
  return getIt;
}

class _$InjectableModule extends _i464.InjectableModule {}
