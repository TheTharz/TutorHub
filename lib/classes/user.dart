import 'chat.dart';

class User {
  int id;
  String email;
  String password;
  String username;
  String picture;
  String city;
  List<Chat> chats;

  User(this.id, this.email, this.password, this.username, this.picture,
      this.city, this.chats);
}
