import 'package:flutter_bloc/flutter_bloc.dart';

part 'community_event.dart';
part 'community_state.dart';

class CommunityBloc extends Bloc<CommunityEvent, CommunityState> {
  CommunityBloc() : super(const CommunityState()) {
    on<ChangeTabEvent>((event, emit) {
      emit(state.copyWith(selectedTab: event.selectedTab));
    });
  }
}