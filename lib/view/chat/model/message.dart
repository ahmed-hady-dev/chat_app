import 'package:chat_app/constants/constants.dart';

class Message {
  final String message;
  final String id;

  Message(this.message, this.id);
  factory Message.fromJson(Map<String, dynamic> jsonDate) {
    return Message(jsonDate[AppConstants.message], jsonDate['id']);
  }
}
