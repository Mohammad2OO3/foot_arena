import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../common/helper/src/data_state_model.dart';
import '../../../../common/helper/src/helper_func.dart';
import '../../data/models/get_version_response.dart';

part 'splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {

  SplashCubit() : super(const SplashState());

  void checkNavigator() {
    if (HelperFunc.isAuth()) {
      emit(state.copyWith(splashStatus: SplashStatus.isAuth));
    } else {
      emit(state.copyWith(splashStatus: SplashStatus.unauthorized));
    }
  }



}
