import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/get_profile_data_use_case.dart';
import 'profile_event.dart';
import 'profile_state.dart';
@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileDataUseCase getProfileDataUseCase;

  ProfileBloc({required this.getProfileDataUseCase}) : super(ProfileInitialState()) {
    on<FetchProfileDataEvent>(_onFetchProfileData);
  }

  Future<void> _onFetchProfileData(
      FetchProfileDataEvent event,
      Emitter<ProfileState> emit,
      ) async {
    emit(ProfileLoadingState());
    try {
      final data = await getProfileDataUseCase();
      emit(ProfileLoadedState(
        profile: data.profile,
        matches: data.matches,
        teams: data.teams,
      ));
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }
}