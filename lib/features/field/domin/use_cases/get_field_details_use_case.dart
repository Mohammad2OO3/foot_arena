import 'package:injectable/injectable.dart';
import '../../../../common/helper/src/typedef.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/model/get_field_details_response.dart';
import '../repositories/field_repositories.dart';

@lazySingleton
class GetFieldDetailsUseCase
    implements UseCase<GetFieldDetailsResponse, int> {
  final FieldRepositories _repositories;

  GetFieldDetailsUseCase({required FieldRepositories repositories})
    : _repositories = repositories;

  @override
  DataResponse<GetFieldDetailsResponse> call(int id) async =>
      await _repositories.getFieldDetails(id);
}
