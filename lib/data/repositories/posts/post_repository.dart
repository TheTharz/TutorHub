import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../features/findTutor/models/tutor_post_model.dart';

class PostRepository extends GetxController {
  static PostRepository get instance => Get.find();

  //firestore instance for database
  final _db = FirebaseFirestore.instance;

  //get all tutorposts
  Future<List<TutorPostModel>> getTutorPosts() async {
    try {
      final snapshot = await _db.collection("TutorPosts").limit(10).get();
      // Print the document data
      snapshot.docs.forEach((document) {
        print('Document ID: ${document.id}, Data: ${document.data()}');
      });

      // Process the data as needed (mapping to a list of TutorPostModel, for example)
      List<TutorPostModel> tutorPosts = snapshot.docs.map((document) {
        return TutorPostModel.fromSnapshot(document);
      }).toList();

      return tutorPosts;
    } catch (e) {
      print('Error fetching tutor posts: $e');

      throw 'Something went wrong here post repository';
    }
  }

  //upload the post
  Future<void> uploadPost(TutorPostModel tutorPost) async {
    try {
      //upload the post
      await _db.collection("TutorPosts").add({
        'Title': tutorPost.title,
        'Description': tutorPost.description,
        'Subject': tutorPost.subject,
        'Grade': tutorPost.grade,
        'GigImage': tutorPost.image,
        'HourlyPrice': tutorPost.hourlyPrice,
        'Location': tutorPost.location,
        'Owner': tutorPost.owner.toJson(),
        'PreferredMethod': tutorPost.preferredMethod,
        'Dates': tutorPost.preferredDate,
        'Degree': tutorPost.degree,
        'Experience': tutorPost.experience,
      });
    } catch (e) {
      print('Error uploading post: $e');

      throw 'Something went wrong here post repository';
    }
  }
}
