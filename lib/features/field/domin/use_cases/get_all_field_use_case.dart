import 'package:injectable/injectable.dart';
import '../../../../common/helper/src/typedef.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/get_all_field_response.dart';
import '../repositories/field_repositories.dart';

@lazySingleton
class GetAllFieldUseCase
    implements UseCase<GetAllFieldResponse, NoParams> {
  final FieldRepositories _repositories;

  GetAllFieldUseCase({required FieldRepositories repositories})
      : _repositories = repositories;

  @override
  DataResponse<GetAllFieldResponse> call(NoParams params) async =>
      await _repositories.getAllField();
}

// class GetAllUserTrackingParams with Params {
//   final int? perPage;
//   final int? page;
//
//
//   GetAllUserTrackingParams({
//     this.perPage,
//     this.page,
//
//   });
//
//   @override
//   QueryParams getParams() {
//     // TODO: implement getParams
//     return {
//       'perPage': perPage.toString(),
//       'page': page.toString(),
//
//     }..removeWhere(
//           (key, value) => value == null || value == '' || value == 'null',
//     );
//   }
// }
