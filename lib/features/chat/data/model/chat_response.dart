import 'package:uuid/uuid.dart';

ChatResponse chatResponseFromJson( str) => ChatResponse.fromJson(str);

class ChatResponse {
  final MessageModel? data;

  ChatResponse({
    this.data,
  });

  ChatResponse copyWith({
    MessageModel? data,
  }) =>
      ChatResponse(
        data: data ?? this.data,
      );

  factory ChatResponse.fromJson(Map<String, dynamic> json) => ChatResponse(
    data: json["data"] == null ? null : MessageModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class MessageModel {
  final String id;
  final String? response;
  final String? intent;
  final List<String>? results;
  final List<String>? suggestedActions;
  final bool isMe;
  final PostMessageState status;

  MessageModel({
    required this.id,
    this.response,
    this.intent,
    this.results,
    this.suggestedActions,
    this.isMe = false,
    this.status = PostMessageState.init,
  });

  MessageModel copyWith({
    String? id,
    String? response,
    String? intent,
    List<String>? results,
    List<String>? suggestedActions,
    bool? isMe,
    PostMessageState? status,
  }) =>
      MessageModel(
        id: id ?? this.id,
        response: response ?? this.response,
        intent: intent ?? this.intent,
        results: results ?? this.results,
        suggestedActions: suggestedActions ?? this.suggestedActions,
        isMe: isMe ?? this.isMe,
        status: status ?? this.status,
      );

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    id: const Uuid().v4(),
    response: json["response"],
    intent: json["intent"],
    results: json["results"] == null
        ? null
        : List<String>.from(json["results"].map((x) => x.toString())),
    suggestedActions: json["suggested_actions"] == null
        ? null
        : List<String>.from(json["suggested_actions"].map((x) => x.toString())),
  );

  Map<String, dynamic> toJson() => {
    "response": response,
    "intent": intent,
    "results": results == null ? null : List<dynamic>.from(results!.map((x) => x)),
    "suggested_actions":
    suggestedActions == null ? null : List<dynamic>.from(suggestedActions!.map((x) => x)),
  };
}

enum PostMessageState { init, load, suc, fail, post }