import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../../../common/helper/src/data_state_model.dart';
import '../../../../common/helper/src/droppable_pro_max.dart';
import '../../../../common/helper/src/pagination_state_model.dart';
import '../../../../common/models/notification_model.dart';
import '../../../../core/use_case/use_case.dart';
import 'package:injectable/injectable.dart';
import '../../domin/use_cases/get_all_notification_use_case.dart';
import '../../domin/use_cases/post_mark_all_use_case.dart';

part 'notification_event.dart';

part 'notification_state.dart';

@lazySingleton
class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetAllNotificationUseCase _getAllNotificationUseCase;
  final GetMarkUseCase _getMarkUseCase;


  NotificationBloc(
      this._getAllNotificationUseCase,
      this._getMarkUseCase,


      )
    : super(NotificationState()) {
    on<GetAllNotificationEvent>(_getAll, transformer: droppableProMax());
    on<GetMarkNotificationEvent>(_getMark);
    on<ResetRejectExtraEvent>(_resetReject);
    on<ResetConfirmExtraEvent>(_resetConfirm);
  }
  FutureOr<void> _resetConfirm(
      ResetConfirmExtraEvent event,
      Emitter<NotificationState> emit,
      ){
    emit(state.copyWith(confirmExtraData: state.confirmExtraData.resetData()));

  }

  FutureOr<void> _resetReject(
      ResetRejectExtraEvent event,
      Emitter<NotificationState> emit,
      ){
    emit(state.copyWith(rejectExtraData: state.rejectExtraData.resetData()));

  }



  FutureOr<void> _getMark(
    GetMarkNotificationEvent event,
    Emitter<NotificationState> emit,
  )
  async {
    final bool isNewsLocale = state.isNew;
    emit(
      state.copyWith(
        getMarkNotification: state.getMarkNotification.setLoading(),
        isNew: false,
      ),
    );
    final result = await _getMarkUseCase(NoParams());
    result.fold(
      (l) {
        emit(
          state.copyWith(
            getMarkNotification: state.getMarkNotification.setFaild(
              errorMessage: l.message,
            ),
            isNew: isNewsLocale,
          ),
        );
      },
      (_) {
        emit(
          state.copyWith(
            getMarkNotification: state.getMarkNotification.setSuccess(),
            isNew: false,
          ),
        );
      },
    );
  }

  FutureOr<void> _getAll(
    GetAllNotificationEvent event,
    Emitter<NotificationState> emit,
  ) async {
    if (!state.getAllNotification.isEndPage || event.isReload) {
      emit(
        state.copyWith(
          getAllNotification: state.getAllNotification.setLoading(
            isReload: event.isReload,
          ),
        ),
      );

      final result = await _getAllNotificationUseCase(
        GetAllNotificationParams(
          page: state.getAllNotification.pageNumber,
          perPage: state.getAllNotification.perPage,
        ),
      );

      result.fold(
        (l) {
          emit(
            state.copyWith(
              getAllNotification: state.getAllNotification.setFaild(
                errorMessage: l.message,
              ),
            ),
          );
        },
        (r) {
          final list = r.data!;

          // final bool isNew = list.any((item) => item.isRead == false);

          emit(
            state.copyWith(
              getAllNotification: state.getAllNotification.setSuccess(
                data: r.data!,
              ),
              // isNew: isNew,
            ),
          );
        },
      );
    }
  }
}
