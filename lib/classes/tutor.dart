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

  void createTutorPost(String title, String description, String subject,
      String grade, String image, double price, String location) {
    TutorPost newPost = TutorPost(posts.length + 1, title, description, subject,
        grade, image, this, price, location);
    posts.add(newPost);
  }

  void updateTutorPost(TutorPost post, String newTitle, String newDescription,
      double newPrice, String newLocation) {
    post.title = newTitle;
    post.description = newDescription;
    post.price = newPrice;
    post.location = newLocation;
  }

  void deleteTutorPost(TutorPost post) {
    posts.remove(post);
  }

  void addSocialLinks(String facebook, String instagram, String linkedin) {
    SocialLink newSocialLink = SocialLink(id, facebook, instagram, linkedin);
    socialLinks.add(newSocialLink);
  }

  void updateTutorInfo(String newTutorName, int newExperience,
      double newHourlyPrice, String newGender) {
    tutorName = newTutorName;
    experience = newExperience;
    hourlyPrice = newHourlyPrice;
    gender = newGender;
  }
}
