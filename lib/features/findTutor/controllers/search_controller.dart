import 'package:get/get.dart';
import 'package:tutorhub/features/authentication/models/user_model.dart';
import 'package:tutorhub/features/findTutor/controllers/post_controller.dart';
import 'package:tutorhub/features/findTutor/models/tutor_post_model.dart';
import 'package:tutorhub/features/findTutor/models/user_post_model.dart';
import 'package:tutorhub/features/personalization/controllers/user_controller.dart';

class QuerySearchController extends GetxController {
  static QuerySearchController get instance => Get.find();

  var search = "".obs;
  var userSearchResut = [].obs;
  var tutorpostSearchResult = [].obs;
  var studentpostSearchResult = [].obs;
  var isSearching = false.obs;
  List<UserModel> users = PostController.instance.tutors;
  List<TutorPostModel> tutorPosts = PostController.instance.tutorPosts;
  List<StudentPostModel> studentPosts = PostController.instance.studentPosts;

  void onSearch(String value) {
    search.value = value;
    if (search.value.length > 0) {
      isSearching.value = true;

      // Filter users
      userSearchResut.value = users
          .where((user) =>
              user.username
                  .toLowerCase()
                  .contains(search.value.toLowerCase()) ||
              user.address!
                  .toLowerCase()
                  .contains(search.value.toLowerCase()) ||
              user.email.toLowerCase().contains(search.value.toLowerCase()) ||
              user.city!.toLowerCase().contains(search.value.toLowerCase()))
          .toList();

      //filter tutor posts
      // Filter tutor posts
      tutorpostSearchResult.value = tutorPosts
          .where((post) =>
              post.title.toLowerCase().contains(search.value.toLowerCase()) ||
              post.description!
                  .toLowerCase()
                  .contains(search.value.toLowerCase()) ||
              post.subject.toLowerCase().contains(search.value.toLowerCase()))
          .toList();

      // Filter student posts
      studentpostSearchResult.value = studentPosts
          .where((post) =>
              post.title.toLowerCase().contains(search.value.toLowerCase()) ||
              post.description!
                  .toLowerCase()
                  .contains(search.value.toLowerCase()) ||
              post.subject.toLowerCase().contains(search.value.toLowerCase()))
          .toList();

      // searchResult.value = searchResult.where((element) => element.contains(search.value)).toList();
    } else {
      isSearching.value = false;
    }
  }
}
