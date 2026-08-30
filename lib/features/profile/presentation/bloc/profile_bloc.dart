import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:footarena/core/use_case/use_case.dart';
import 'package:footarena/features/profile/domain/use_cases/get_user_profile_use_case.dart';
import 'package:footarena/features/profile/domain/use_cases/edit_profile_data_use_case.dart';
import 'package:injectable/injectable.dart';
import '../../../../common/helper/src/app_varibles.dart';
import 'profile_event.dart';
import 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  // final GetProfileDataUseCase getProfileDataUseCase;
  final GetUserProfileUseCase _getUserProfileUseCase;
  final EditProfileDataUseCase _editProfileDataUseCase;

  ProfileBloc(this._getUserProfileUseCase, this._editProfileDataUseCase)
    : super(ProfileState()) {
    on<GetProfileEvent>(_getProfile);
    on<EditProfileEvent>(_editProfile);
  }

  FutureOr<void> _getProfile(
    GetProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(getProfileData: state.getProfileData.setLoading()));

    final val = await _getUserProfileUseCase(NoParams());

    val.fold(
      (l) {
        emit(
          state.copyWith(
            getProfileData: state.getProfileData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            getProfileData: state.getProfileData.setSuccess(data: r),
          ),
        );
        AppVariables.user = r.data!;
      },
    );
  }

  FutureOr<void> _editProfile(
    EditProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(editProfileData: state.editProfileData.setLoading()));

    final val = await _editProfileDataUseCase(event.params);

    val.fold(
      (l) {
        emit(
          state.copyWith(
            editProfileData: state.editProfileData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            editProfileData: state.editProfileData.setSuccess(data: r),
          ),
        );
        AppVariables.user = r.data!;
      },
    );
  }

  // Future<void> _onFetchProfileData(
  //     FetchProfileDataEvent event,
  //     Emitter<ProfileState> emit,
  //     )
  // async {
  //   emit(ProfileLoadingState());
  //   try {
  //     final data = await getProfileDataUseCase();
  //     emit(ProfileLoadedState(
  //       profile: data.profile,
  //       matches: data.matches,
  //       teams: data.teams,
  //     ));
  //   } catch (e) {
  //     emit(ProfileErrorState(e.toString()));
  //   }
  // }
}
