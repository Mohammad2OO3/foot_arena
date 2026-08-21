import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState(currentIndex: 0)) {
    on<PageChanged>((event, emit) {
      emit(state.copyWith(currentIndex: event.index));
    });

    on<NextPressed>((event, emit) {
      if (state.currentIndex < 2) {
        emit(state.copyWith(currentIndex: state.currentIndex + 1));
      }
    });
  }
}
