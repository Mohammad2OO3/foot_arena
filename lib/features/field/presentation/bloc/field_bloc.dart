import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:footarena/common/helper/helper.dart';
import 'package:footarena/core/use_case/use_case.dart';
import 'package:footarena/features/field/data/model/get_all_field_slot_response.dart';
import 'package:footarena/features/field/data/model/get_field_details_response.dart';
import 'package:footarena/features/field/domin/use_cases/get_all_field_slot_use_case.dart';
import 'package:footarena/features/field/domin/use_cases/get_all_field_use_case.dart';
import 'package:footarena/features/field/domin/use_cases/get_field_details_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/get_all_field_response.dart';

part 'field_event.dart';

part 'field_state.dart';

@injectable
class FieldBloc extends Bloc<FieldEvent, FieldState> {
  final GetAllFieldUseCase _getAllFieldUseCase;
  final GetAllFieldSlotUseCase _getAllFieldSlotUseCase;
  final GetFieldDetailsUseCase _getFieldDetailsUseCase;

  FieldBloc(
    this._getAllFieldUseCase,
    this._getAllFieldSlotUseCase,
    this._getFieldDetailsUseCase,
  ) : super(FieldState()) {
    on<GetAllFieldEvent>(_getAllField);
    on<GetFieldDetailsEvent>(_getFieldDetails);
    on<GetAllSlotEvent>(_getAllSlots);
  }

  FutureOr<void> _getAllSlots(
    GetAllSlotEvent event,
    Emitter<FieldState> emit,
  ) async {
    emit(state.copyWith(getAllSlotsData: state.getAllSlotsData.setLoading()));

    final val = await _getAllFieldSlotUseCase(event.params);

    val.fold(
      (l) {
        emit(
          state.copyWith(
            getAllSlotsData: state.getAllSlotsData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            getAllSlotsData: state.getAllSlotsData.setSuccess(data: r),
          ),
        );
      },
    );
  }

  FutureOr<void> _getFieldDetails(
    GetFieldDetailsEvent event,
    Emitter<FieldState> emit,
  ) async {
    emit(
      state.copyWith(
        getFieldDetailsData: state.getFieldDetailsData.setLoading(),
      ),
    );

    final val = await _getFieldDetailsUseCase(event.id);

    val.fold(
      (l) {
        emit(
          state.copyWith(
            getFieldDetailsData: state.getFieldDetailsData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            getFieldDetailsData: state.getFieldDetailsData.setSuccess(data: r),
            getAllSlotsData: state.getAllSlotsData.resetData(),
          ),
        );
      },
    );
  }

  FutureOr<void> _getAllField(
    GetAllFieldEvent event,
    Emitter<FieldState> emit,
  ) async {
    emit(state.copyWith(getAllFieldData: state.getAllFieldData.setLoading()));

    final val = await _getAllFieldUseCase(NoParams());

    val.fold(
      (l) {
        emit(
          state.copyWith(
            getAllFieldData: state.getAllFieldData.setFaild(
              errorMessage: l.message,
            ),
          ),
        );
      },
      (r) {
        emit(
          state.copyWith(
            getAllFieldData: state.getAllFieldData.setSuccess(data: r),
          ),
        );
      },
    );
  }
}
