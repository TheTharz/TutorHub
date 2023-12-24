import 'chat.dart';
import 'user.dart';

class MessageService {
  List<Chat> chats;

  MessageService(this.chats);

  // Create a new chat between two users
  void createChat(User user1, User user2) {}

  // Send a message from one user to another
  void sendMessage(User sender, User receiver, String content) {}

  // Find a chat between two users
  void findChat(User user1, User user2) {}

  // Get message history for a specific chat
  void getMessageHistory(Chat chat) {}
}
