import 'package:footarena/features/field/data/model/get_all_field_slot_response.dart';
import 'package:footarena/features/field/domin/use_cases/get_all_field_slot_use_case.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/unified_api/api_variables.dart';
import '../../../../core/unified_api/dio/api_client.dart';
import '../../../../core/unified_api/error/api_handeler_manager.dart';
import '../model/get_all_field_response.dart';
import '../model/get_field_details_response.dart';

@lazySingleton
class ProductRemoteData with HandlingApiManager {
  final ApiClient _apiClient;

  ProductRemoteData({required ApiClient apiClient}) : _apiClient = apiClient;

  Future<GetAllFieldResponse> getAllField() async {
    return wrapHandlingApi(
      tryCall: () => _apiClient.get(ApiVariables.getAllField()),
      jsonConvert: getAllFieldResponseFromJson,
    );
  }

  Future<GetFieldDetailsResponse> getProductDetails(int id) async {
    return wrapHandlingApi(
      tryCall: () => _apiClient.get(ApiVariables.getFieldDetails(id)),
      jsonConvert: getFieldDetailsResponseFromJson,
    );
  }

  Future<GetAllFiledSlotResponse> getAllSlot(
    GetAllFieldSlotParams params,
  ) async {
    return wrapHandlingApi(
      tryCall: () => _apiClient.get(
        ApiVariables.getAllSlots(params.fieldId, params.getParams()),
      ),
      jsonConvert: getAllFiledSlotResponseFromJson,
    );
  }
}
