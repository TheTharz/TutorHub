import 'user.dart';

class Message {
  int id;
  User sender;
  User receiver;
  String content;
  DateTime timestamp;

  Message(this.id, this.sender, this.receiver, this.content, this.timestamp);
}
