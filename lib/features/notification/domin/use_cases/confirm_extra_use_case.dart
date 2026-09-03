import '../../../../common/helper/src/typedef.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/use_case/use_case.dart';
import '../../data/model/get_all_notification_response.dart';
import '../repositories/notification_repositories.dart';

@lazySingleton
class ConfirmExtraUseCase
    implements UseCase<void, int> {
  final NotificationRepositories _repositories;

  ConfirmExtraUseCase({required NotificationRepositories repositories})
      : _repositories = repositories;

  @override
  DataResponse<void> call(
      int params
      ) async => await _repositories.confirmExtra(params);
}

