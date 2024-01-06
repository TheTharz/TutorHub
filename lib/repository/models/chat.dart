import 'message.dart';
import 'user.dart';

class Chat {
  int id;
  User user1;
  User user2;
  List<Message> messages;

  Chat(this.id, this.user1, this.user2, this.messages);

  toJson() {}
}
