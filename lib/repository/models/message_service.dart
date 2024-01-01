import 'chat.dart';
import 'user.dart';

class MessageService {
  List<Chat> chats;

  MessageService(this.chats);

  void createChat(User user1, User user2) {}

  void sendMessage(User sender, User receiver, String content) {}

  void findChat(User user1, User user2) {}

  void getMessageHistory(Chat chat) {}
}
