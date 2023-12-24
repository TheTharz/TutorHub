import 'package:tutorhub/classes/student_post.dart';

import 'chat.dart';
import 'user.dart';

class Student extends User {
  List<String> preferences;
  List<StudentPost> studentPosts;

  Student(
    int id,
    String email,
    String password,
    String username,
    String picture,
    String city,
    List<Chat> chats,
    this.preferences,
    this.studentPosts,
  ) : super(id, email, password, username, picture, city, chats);
}
