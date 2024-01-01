import 'post.dart';
import 'tutor.dart';

class TutorPost extends Post {
  Tutor tutor;
  double price;
  String location;

  TutorPost(
    int id,
    String title,
    String description,
    String subject,
    String grade,
    String image,
    this.tutor,
    this.price,
    this.location,
  ) : super(id, title, description, subject, grade, image);
}
