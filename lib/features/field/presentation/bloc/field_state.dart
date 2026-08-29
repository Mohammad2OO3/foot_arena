part of 'field_bloc.dart';

class FieldState {
  final DataStateModel<GetAllFieldResponse?> getAllFieldData;
  final DataStateModel<GetAllFiledSlotResponse?> getAllSlotsData;

  final DataStateModel<GetFieldDetailsResponse?> getFieldDetailsData;

  FieldState({
    this.getAllFieldData = const DataStateModel.setDefultValue(
      defultValue: null,
    ),
    this.getAllSlotsData = const DataStateModel.setDefultValue(
      defultValue: null,
    ),
    this.getFieldDetailsData = const DataStateModel.setDefultValue(
      defultValue: null,
    ),
  });

  FieldState copyWith({
    DataStateModel<GetAllFieldResponse?>? getAllFieldData,
    DataStateModel<GetAllFiledSlotResponse?>? getAllSlotsData,
    DataStateModel<GetFieldDetailsResponse?>? getFieldDetailsData,
}) => FieldState(
    getAllFieldData: getAllFieldData ?? this.getAllFieldData,
    getAllSlotsData: getAllSlotsData ?? this.getAllSlotsData,
    getFieldDetailsData: getFieldDetailsData ?? this.getFieldDetailsData,
  );
}
