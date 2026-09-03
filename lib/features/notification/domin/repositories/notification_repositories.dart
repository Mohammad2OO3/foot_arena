import '../../../../common/helper/src/typedef.dart';
import '../../data/model/get_all_notification_response.dart';

abstract class NotificationRepositories {
  DataResponse<GetAllNotificationResponse> getAllNotification(QueryParams params);

  DataResponse<void> postMarkAll();
  DataResponse<void> confirmExtra(int id);
  DataResponse<void> rejectExtra(int id);


}
