import 'package:injectable/injectable.dart';
import '../../../../common/helper/src/typedef.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/get_all_field_slot_response.dart';
import '../repositories/field_repositories.dart';

@lazySingleton
class GetAllFieldSlotUseCase
    implements UseCase<GetAllFiledSlotResponse, GetAllFieldSlotParams> {
  final FieldRepositories _repositories;

  GetAllFieldSlotUseCase({required FieldRepositories repositories})
      : _repositories = repositories;

  @override
  DataResponse<GetAllFiledSlotResponse> call(GetAllFieldSlotParams params) async =>
      await _repositories.getFieldSlots(params);
}

class GetAllFieldSlotParams with Params {
  final String date;
  final int fieldId;

  GetAllFieldSlotParams({required this.date, required this.fieldId});


  @override
  QueryParams getParams() {
    // TODO: implement getParams
    return {
      'field': fieldId.toString(),
      'date': date,

    }..removeWhere(
          (key, value) => value == null || value == '' || value == 'null',
    );
  }
}

