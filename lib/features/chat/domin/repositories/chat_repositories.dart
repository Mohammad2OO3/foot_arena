import '../../../../common/helper/src/typedef.dart';
import '../../data/model/chat_response.dart';

abstract class ChatRepositories {

  DataResponse<ChatResponse> sendMessage(BodyMap params);
}