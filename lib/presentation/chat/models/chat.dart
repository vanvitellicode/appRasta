import 'package:rms/presentation/chat/models/chat_message_type.dart';

class Chat {
  final String message;
  final ChatMessageType type;
  final DateTime time;

  Chat({required this.message, required this.type, required this.time});

  factory Chat.sent({required message}) =>
      Chat(message: message, type: ChatMessageType.sent, time: DateTime.now());

  factory Chat.received({required message}) =>
      Chat(message: message, type: ChatMessageType.received, time: DateTime.now());

  
  


}
