import 'post.dart';
import 'student.dart';

class StudentPost extends Post {
  Student student;
  double price;
  String location;

  StudentPost(
    int id,
    String title,
    String description,
    String subject,
    String grade,
    String image,
    this.student,
    this.price,
    this.location,
  ) : super(id, title, description, subject, grade, image);
}
