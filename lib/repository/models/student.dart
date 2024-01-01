import 'package:tutorhub/repository/models/student_post.dart';

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

  @override
  void addChat(Chat newChat) {}

  @override
  Chat findChatWithUser(User otherUser) {
    throw UnimplementedError();
  }

  @override
  List<Chat> getChats() {
    throw UnimplementedError();
  }

  @override
  void removeChat(Chat chatToRemove) {}

  @override
  void updateUserInfo(String newEmail, String newPassword, String newUsername,
      String newPicture, String newCity) {}

  void createStudentPost(String title, String description, String subject,
      String grade, String image, double price, String location) {
    StudentPost newPost = StudentPost(studentPosts.length + 1, title,
        description, subject, grade, image, this, price, location);
    studentPosts.add(newPost);
  }

  void updateStudentPost(StudentPost post, String newTitle,
      String newDescription, double newPrice, String newLocation) {
    post.title = newTitle;
    post.description = newDescription;
    post.price = newPrice;
    post.location = newLocation;
  }

  void deleteStudentPost(StudentPost post) {
    studentPosts.remove(post);
  }

  List<StudentPost> filterStudentPostsBySubject(String subject) {
    return studentPosts.where((post) => post.subject == subject).toList();
  }
}
