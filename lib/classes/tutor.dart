import 'package:tutorhub/classes/social_link.dart';
import 'package:tutorhub/classes/tutor_post.dart';

import 'chat.dart';
import 'qualification.dart';
import 'user.dart';

class Tutor extends User {
  List<Qualification> qualifications;
  String tutorName;
  int experience;
  double hourlyPrice;
  String gender;
  List<SocialLink> socialLinks;
  List<String> reviews;
  List<TutorPost> posts;

  Tutor(
    int id,
    String email,
    String password,
    String username,
    String picture,
    String city,
    List<Chat> chats,
    this.qualifications,
    this.tutorName,
    this.experience,
    this.hourlyPrice,
    this.gender,
    this.socialLinks,
    this.reviews,
    this.posts,
  ) : super(id, email, password, username, picture, city, chats);
}
