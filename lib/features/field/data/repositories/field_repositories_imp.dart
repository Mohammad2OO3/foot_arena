import 'package:footarena/features/field/data/model/get_all_field_response.dart';

import 'package:footarena/features/field/data/model/get_all_field_slot_response.dart';

import '../../../../common/helper/src/typedef.dart';
import '../../../../core/unified_api/error/error_handeler.dart';
import '../../domin/repositories/field_repositories.dart';
import 'package:injectable/injectable.dart';
import '../../domin/use_cases/get_all_field_slot_use_case.dart';
import '../data_source/field_remote_data.dart';
import '../model/get_field_details_response.dart';

@LazySingleton(as: FieldRepositories)
class FieldRepositoriesImp
    with HandlingException
    implements FieldRepositories {
  final ProductRemoteData _remoteData;

  FieldRepositoriesImp({required ProductRemoteData remoteData})
    : _remoteData = remoteData;

  @override
  DataResponse<GetAllFieldResponse> getAllField()  =>
      wrapHandlingException(tryCall: () => _remoteData.getAllField());
  @override
  DataResponse<GetFieldDetailsResponse> getFieldDetails(int id)  =>
      wrapHandlingException(tryCall: () => _remoteData.getProductDetails(id));

  @override
  DataResponse<GetAllFiledSlotResponse> getFieldSlots(GetAllFieldSlotParams params)  =>
      wrapHandlingException(tryCall: () => _remoteData.getAllSlot(params));


}
