import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import '../../../../common/helper/src/data_state_model.dart';
import '../../data/model/chat_response.dart';
import '../../domin/use_cases/send_message_use_case.dart';

part 'chat_event.dart';

part 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessageUseCase _sendMessageUseCase;

  ChatBloc(this._sendMessageUseCase) : super(ChatState()) {
    on<SendMessageEvent>(_sendMessage);



  }




  FutureOr<void> _sendMessage(
    SendMessageEvent event,
    Emitter<ChatState> emit,
  )
  async {
    final String random = const Uuid().v4();
    final MessageModel message = MessageModel(
      response: event.params.message,
      isMe: true,
      status: PostMessageState.load,
      id: random,
    );

    final List<MessageModel> list = [...state.messages, message];

    emit(state.copyWith(chatData: state.chatData.setLoading(), messages: list));

    final val = await _sendMessageUseCase(event.params);

    val.fold(
      (l) {
        final List<MessageModel> list = List.from(
          state.messages.map(
            (e) =>
                e.id == random ? e.copyWith(status: PostMessageState.fail) : e,
          ),
        );

        emit(
          state.copyWith(
            chatData: state.chatData.setFaild(errorMessage: l.message),
            messages: list,
          ),
        );
      },
      (r) {
        final List<MessageModel> firstList = List.from(
          state.messages.map(
            (e) =>
                e.id == random ? e.copyWith(status: PostMessageState.suc) : e,
          ),
        );

        final List<MessageModel> list = [...firstList, r.data!];

        emit(
          state.copyWith(
            chatData: state.chatData.setSuccess(data: r),
            messages: list,
          ),
        );
      },
    );
    if (emit.isDone) return;

    emit(state.copyWith(chatData: state.chatData.resetData()));
  }

  ////
}
