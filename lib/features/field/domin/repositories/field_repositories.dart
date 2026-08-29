import 'package:footarena/features/field/data/model/get_all_field_response.dart';
import 'package:footarena/features/field/data/model/get_all_field_slot_response.dart';
import '../../../../common/helper/src/typedef.dart';
import '../../data/model/get_field_details_response.dart';
import '../use_cases/get_all_field_slot_use_case.dart';

abstract class FieldRepositories {


  DataResponse<GetAllFieldResponse> getAllField();

  DataResponse<GetFieldDetailsResponse> getFieldDetails(int id);




  DataResponse<GetAllFiledSlotResponse> getFieldSlots(GetAllFieldSlotParams params);

}
