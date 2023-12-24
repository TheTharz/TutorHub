import 'student.dart';

class Review {
  Student author;
  String description;
  DateTime timestamp;
  double rating;

  Review(this.author, this.description, this.timestamp, this.rating);
}
