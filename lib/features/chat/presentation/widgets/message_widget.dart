import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/extensions/src/context_extensions.dart';
import '../../../../common/helper/helper.dart';
import '../../../chat/presentation/bloc/chat_bloc.dart';
import '../../data/model/chat_response.dart';
import '../../domin/use_cases/send_message_use_case.dart';
import 'message_bubble.dart';

class MessageWidget extends StatelessWidget {
  final ChatBloc chatBloc;
  final MessageModel message;
  final int index;

  const MessageWidget({
    super.key,
    required this.chatBloc,
    required this.message,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMe = message.isMe;
    final isArabic = context.locale.languageCode == 'ar';
    return Align(
      alignment: isMe
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      child: BlocBuilder<ChatBloc, ChatState>(
        bloc: chatBloc,
        builder: (context, state) {
          return GestureDetector(
            onTap: state.messages[index].status == PostMessageState.fail
                ? () {
              chatBloc.add(
                SendMessageEvent(
                  params: SendMessageParams(
                    message: message.response!,
                  ),
                ),
              );
            }
                : null,
            child: Column(
              crossAxisAlignment: isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                MessageBubble(
                  isArabic: isArabic,
                  isMe: isMe,
                  child: Text(
                    message.response!,
                    style: context.headlineMedium(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: isMe ? context.textColor : context.cardColor,
                    ),
                    softWrap: true,
                  ),
                ),
                Row(
                  mainAxisAlignment: isMe
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    if (isMe)
                      Container(
                        padding: const EdgeInsets.only(right: 5),
                        child: switch (state.messages[index]!.status) {
                          PostMessageState.init ||
                          PostMessageState.load => const Icon(
                            Icons.access_time_outlined,
                            color: Colors.grey,
                            size: 15,
                          ),
                          PostMessageState.suc => const Icon(
                            Icons.check,
                            color: Colors.grey,
                            size: 15,
                          ),
                          PostMessageState.post => const Icon(
                            Icons.check_circle,
                            color: Colors.grey,
                            size: 15,
                          ),
                          PostMessageState.fail => const Icon(
                            Icons.sms_failed_outlined,
                            color: Colors.red,
                            size: 15,
                          ),
                        },
                      ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class ChatBubbleClipper extends CustomClipper<Path> {
  final bool isMe;

  ChatBubbleClipper({required this.isMe});

  @override
  Path getClip(Size size) {
    final path = Path();

    if (isMe) {
      // Tail on the left
      path.moveTo(10, 0);
      path.lineTo(size.width, 0);
      path.lineTo(size.width, size.height);
      path.lineTo(10, size.height);
      path.quadraticBezierTo(0, size.height, 0, size.height - 10);
      path.lineTo(0, 10);
      path.quadraticBezierTo(0, 0, 10, 0);
    } else {
      // Tail on the right
      path.moveTo(0, 0);
      path.lineTo(size.width - 10, 0);
      path.quadraticBezierTo(size.width, 0, size.width, 10);
      path.lineTo(size.width, size.height - 10);
      path.quadraticBezierTo(
        size.width,
        size.height,
        size.width - 10,
        size.height,
      );
      path.lineTo(0, size.height);
      path.lineTo(0, 0);
    }

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}