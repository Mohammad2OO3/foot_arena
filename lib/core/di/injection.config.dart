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
import '../../features/auth/data/data_sources/remote_auth_data_source.dart'
    as _i774;
import '../../features/auth/data/repositories/auth_repo_impl.dart' as _i662;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/use_cases/log_out_use_case.dart' as _i446;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i1012;
import '../../features/auth/domain/use_cases/signup_use_case.dart' as _i571;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/community/data/data_source/community_remote_data.dart'
    as _i533;
import '../../features/community/data/repositories/community_repositories_imp.dart'
    as _i848;
import '../../features/community/domin/repositories/community_repositories.dart'
    as _i671;
import '../../features/community/domin/use_cases/accept_challenge_use_case.dart'
    as _i458;
import '../../features/community/domin/use_cases/accept_request_to_join_use_case.dart'
    as _i245;
import '../../features/community/domin/use_cases/add_challenge_use_case.dart'
    as _i136;
import '../../features/community/domin/use_cases/add_team_use_case.dart'
    as _i43;
import '../../features/community/domin/use_cases/cancel_challenge_use_case.dart'
    as _i46;
import '../../features/community/domin/use_cases/get_all_challenge_use_case.dart'
    as _i37;
import '../../features/community/domin/use_cases/get_all_request_to_join_use_case.dart'
    as _i493;
import '../../features/community/domin/use_cases/get_all_team_use_case.dart'
    as _i425;
import '../../features/community/domin/use_cases/get_challenge_details_use_case.dart'
    as _i640;
import '../../features/community/domin/use_cases/get_my_team_use_case.dart'
    as _i839;
import '../../features/community/domin/use_cases/get_team_details_use_case.dart'
    as _i578;
import '../../features/community/domin/use_cases/reject_challenge_use_case.dart'
    as _i406;
import '../../features/community/domin/use_cases/reject_request_to_join_use_case.dart'
    as _i54;
import '../../features/community/domin/use_cases/request_to_join_use_case.dart'
    as _i624;
import '../../features/community/domin/use_cases/transfer_team_use_case.dart'
    as _i290;
import '../../features/community/presentation/bloc/community_bloc.dart'
    as _i354;
import '../../features/field/data/data_source/field_remote_data.dart' as _i166;
import '../../features/field/data/repositories/field_repositories_imp.dart'
    as _i1054;
import '../../features/field/domin/repositories/field_repositories.dart'
    as _i333;
import '../../features/field/domin/use_cases/get_all_field_slot_use_case.dart'
    as _i603;
import '../../features/field/domin/use_cases/get_all_field_use_case.dart'
    as _i522;
import '../../features/field/domin/use_cases/get_field_details_use_case.dart'
    as _i1019;
import '../../features/profile/data/data_sources/profile_remote_data_source.dart'
    as _i1012;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i334;
import '../../features/profile/domain/repositories/profile_repository.dart'
    as _i894;
import '../../features/profile/domain/use_cases/get_user_profile_use_case.dart'
    as _i903;
import '../../features/profile/presentation/bloc/profile_bloc.dart' as _i469;
import '../../features/splash/data/data_sources/version_remote_data.dart'
    as _i328;
import '../../features/splash/data/repositories/version_repositories_imp.dart'
    as _i837;
import '../../features/splash/domain/repositories/version_repositories.dart'
    as _i16;
import '../../features/splash/domain/use_cases/get_version_use_case.dart'
    as _i1023;
import '../../features/splash/page/cubit/splash_cubit.dart' as _i547;
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
  gh.factory<_i547.SplashCubit>(() => _i547.SplashCubit());
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
  gh.lazySingleton<_i774.AuthRemoteData>(
    () => _i774.AuthRemoteData(apiClient: gh<_i357.ApiClient>()),
  );
  gh.lazySingleton<_i533.CommunityRemoteData>(
    () => _i533.CommunityRemoteData(apiClient: gh<_i357.ApiClient>()),
  );
  gh.lazySingleton<_i166.ProductRemoteData>(
    () => _i166.ProductRemoteData(apiClient: gh<_i357.ApiClient>()),
  );
  gh.lazySingleton<_i1012.ProfileRemoteDataSource>(
    () => _i1012.ProfileRemoteDataSource(apiClient: gh<_i357.ApiClient>()),
  );
  gh.lazySingleton<_i328.VersionRemoteData>(
    () => _i328.VersionRemoteData(apiClient: gh<_i357.ApiClient>()),
  );
  gh.lazySingleton<_i894.ProfileRepository>(
    () => _i334.ProfileRepositoryImpl(
      remoteData: gh<_i1012.ProfileRemoteDataSource>(),
    ),
  );
  gh.lazySingleton<_i671.CommunityRepositories>(
    () => _i848.CommunityRepositoriesImp(
      remoteData: gh<_i533.CommunityRemoteData>(),
    ),
  );
  gh.lazySingleton<_i787.AuthRepository>(
    () => _i662.AuthRepositoriesImp(remoteData: gh<_i774.AuthRemoteData>()),
  );
  gh.lazySingleton<_i333.FieldRepositories>(
    () =>
        _i1054.FieldRepositoriesImp(remoteData: gh<_i166.ProductRemoteData>()),
  );
  gh.lazySingleton<_i603.GetAllFieldSlotUseCase>(
    () => _i603.GetAllFieldSlotUseCase(
      repositories: gh<_i333.FieldRepositories>(),
    ),
  );
  gh.lazySingleton<_i522.GetAllFieldUseCase>(
    () => _i522.GetAllFieldUseCase(repositories: gh<_i333.FieldRepositories>()),
  );
  gh.lazySingleton<_i1019.GetFieldDetailsUseCase>(
    () => _i1019.GetFieldDetailsUseCase(
      repositories: gh<_i333.FieldRepositories>(),
    ),
  );
  gh.lazySingleton<_i903.GetUserProfileUseCase>(
    () => _i903.GetUserProfileUseCase(
      profileRepository: gh<_i894.ProfileRepository>(),
    ),
  );
  gh.lazySingleton<_i16.VersionRepositories>(
    () =>
        _i837.VersionRepositoriesImp(remoteData: gh<_i328.VersionRemoteData>()),
  );
  gh.lazySingleton<_i458.AcceptChallengeUseCase>(
    () => _i458.AcceptChallengeUseCase(
      repositories: gh<_i671.CommunityRepositories>(),
    ),
  );
  gh.lazySingleton<_i245.AcceptRequestToJoinUseCase>(
    () => _i245.AcceptRequestToJoinUseCase(
      repositories: gh<_i671.CommunityRepositories>(),
    ),
  );
  gh.lazySingleton<_i136.AddChallengeUseCase>(
    () => _i136.AddChallengeUseCase(
      repositories: gh<_i671.CommunityRepositories>(),
    ),
  );
  gh.lazySingleton<_i43.AddTeamUseCase>(
    () => _i43.AddTeamUseCase(repositories: gh<_i671.CommunityRepositories>()),
  );
  gh.lazySingleton<_i46.CancelChallengeUseCase>(
    () => _i46.CancelChallengeUseCase(
      repositories: gh<_i671.CommunityRepositories>(),
    ),
  );
  gh.lazySingleton<_i37.GetAllChallengeUseCase>(
    () => _i37.GetAllChallengeUseCase(
      repositories: gh<_i671.CommunityRepositories>(),
    ),
  );
  gh.lazySingleton<_i493.GetAllRequestToJoinUseCase>(
    () => _i493.GetAllRequestToJoinUseCase(
      repositories: gh<_i671.CommunityRepositories>(),
    ),
  );
  gh.lazySingleton<_i425.GetAllTeamUseCase>(
    () => _i425.GetAllTeamUseCase(
      repositories: gh<_i671.CommunityRepositories>(),
    ),
  );
  gh.lazySingleton<_i640.GetChallengeDetailsUseCase>(
    () => _i640.GetChallengeDetailsUseCase(
      repositories: gh<_i671.CommunityRepositories>(),
    ),
  );
  gh.lazySingleton<_i839.GetMyTeamUseCase>(
    () =>
        _i839.GetMyTeamUseCase(repositories: gh<_i671.CommunityRepositories>()),
  );
  gh.lazySingleton<_i578.GetTeamDetailsUseCase>(
    () => _i578.GetTeamDetailsUseCase(
      repositories: gh<_i671.CommunityRepositories>(),
    ),
  );
  gh.lazySingleton<_i406.RejectChallengeUseCase>(
    () => _i406.RejectChallengeUseCase(
      repositories: gh<_i671.CommunityRepositories>(),
    ),
  );
  gh.lazySingleton<_i54.RejectRequestToJoinUseCase>(
    () => _i54.RejectRequestToJoinUseCase(
      repositories: gh<_i671.CommunityRepositories>(),
    ),
  );
  gh.lazySingleton<_i624.RequestToJoinUseCase>(
    () => _i624.RequestToJoinUseCase(
      repositories: gh<_i671.CommunityRepositories>(),
    ),
  );
  gh.lazySingleton<_i290.TransferTeamUseCase>(
    () => _i290.TransferTeamUseCase(
      repositories: gh<_i671.CommunityRepositories>(),
    ),
  );
  gh.factory<_i354.CommunityBloc>(
    () => _i354.CommunityBloc(
      gh<_i425.GetAllTeamUseCase>(),
      gh<_i578.GetTeamDetailsUseCase>(),
      gh<_i839.GetMyTeamUseCase>(),
      gh<_i43.AddTeamUseCase>(),
      gh<_i290.TransferTeamUseCase>(),
      gh<_i493.GetAllRequestToJoinUseCase>(),
      gh<_i624.RequestToJoinUseCase>(),
      gh<_i245.AcceptRequestToJoinUseCase>(),
      gh<_i54.RejectRequestToJoinUseCase>(),
      gh<_i37.GetAllChallengeUseCase>(),
      gh<_i640.GetChallengeDetailsUseCase>(),
      gh<_i136.AddChallengeUseCase>(),
      gh<_i458.AcceptChallengeUseCase>(),
      gh<_i46.CancelChallengeUseCase>(),
      gh<_i406.RejectChallengeUseCase>(),
    ),
  );
  gh.lazySingleton<_i446.LogOutUseCase>(
    () => _i446.LogOutUseCase(authRepositories: gh<_i787.AuthRepository>()),
  );
  gh.lazySingleton<_i1012.LoginUseCase>(
    () => _i1012.LoginUseCase(authRepositories: gh<_i787.AuthRepository>()),
  );
  gh.lazySingleton<_i571.SignupUseCase>(
    () => _i571.SignupUseCase(authRepositories: gh<_i787.AuthRepository>()),
  );
  gh.lazySingleton<_i1023.GetVersionUseCase>(
    () => _i1023.GetVersionUseCase(
      authRepositories: gh<_i16.VersionRepositories>(),
    ),
  );
  gh.factory<_i469.ProfileBloc>(
    () => _i469.ProfileBloc(gh<_i903.GetUserProfileUseCase>()),
  );
  gh.factory<_i797.AuthBloc>(
    () => _i797.AuthBloc(
      gh<_i1012.LoginUseCase>(),
      gh<_i571.SignupUseCase>(),
      gh<_i446.LogOutUseCase>(),
    ),
  );
  return getIt;
}

class _$InjectableModule extends _i464.InjectableModule {}
