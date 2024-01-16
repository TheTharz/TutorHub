import 'package:get/get.dart';
import 'package:tutorhub/data/repositories/authentication/authentication_repository.dart';
import 'package:tutorhub/data/repositories/posts/post_repository.dart';
import 'package:tutorhub/features/findTutor/models/tutor_post_model.dart';
import 'package:tutorhub/features/personalization/controllers/user_controller.dart';
import 'package:tutorhub/repository/models/user.dart';
import 'package:tutorhub/utils/helpers/loader/loarder.dart';

import '../../authentication/models/user_model.dart';

class PostController extends GetxController {
  static PostController get instance => Get.find();
  final postRepository = Get.put(PostRepository());

  RxBool isLoading = false.obs;
  RxList<TutorPostModel> tutorPosts = <TutorPostModel>[].obs;
  RxList<UserModel> tutors = <UserModel>[].obs;
  RxList<TutorPostModel> filterPosts = <TutorPostModel>[].obs;
  RxString search = ''.obs;

  @override
  void onInit() {
    fetchTutorPosts();
    fetchTutors();
    super.onInit();
  }

  void fetchTutorPosts() async {
    try {
      isLoading.value = true;

      //fetch products
      final posts = await postRepository.getTutorPosts();

      print('Posts: $posts');

      //assign products
      tutorPosts.assignAll(posts);
      // filterPosts.assignAll(posts);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void fetchTutors() async {
    try {
      //fetch tutors
      final tutorsFetched = await postRepository.getTutors();

      print('Tutors fetched: $tutors');

      //assign products
      tutors.assignAll(tutorsFetched);
      // filterPosts.assignAll(posts);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      // isLoading.value = false;
    }
  }

  void searchPost(String value) {
    search.value = value;
    filterPosts.value = tutorPosts
        .where((post) =>
            post.title.toLowerCase().contains(value.toLowerCase()) ||
            post.owner.username.toLowerCase().contains(value.toLowerCase()))
        .toList();
  }

  //posts created by the user
  List<TutorPostModel> get myPosts {
    return tutorPosts
        .where(
            (post) => post.owner.id == Get.put(UserController()).user.value.id)
        .toList();
  }
}
