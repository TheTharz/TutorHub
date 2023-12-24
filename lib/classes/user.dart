import 'chat.dart';

abstract class User {
  int id;
  String email;
  String password;
  String username;
  String picture;
  String city;
  List<Chat> chats;

  User(this.id, this.email, this.password, this.username, this.picture,
      this.city, this.chats);

  void updateUserInfo(String newEmail, String newPassword, String newUsername,
      String newPicture, String newCity);

  List<Chat> getChats();

  void addChat(Chat newChat);

  void removeChat(Chat chatToRemove);

  Chat findChatWithUser(User otherUser);
}
