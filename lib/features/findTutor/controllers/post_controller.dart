import 'package:get/get.dart';
import 'package:tutorhub/data/repositories/authentication/authentication_repository.dart';
import 'package:tutorhub/data/repositories/posts/post_repository.dart';
import 'package:tutorhub/features/findTutor/models/tutor_post_model.dart';
import 'package:tutorhub/features/findTutor/models/user_post_model.dart';
import 'package:tutorhub/features/personalization/controllers/user_controller.dart';
import 'package:tutorhub/repository/models/user.dart';
import 'package:tutorhub/utils/helpers/loader/loarder.dart';

import '../../../utils/helpers/loader/full_screen_loader.dart';
import '../../../utils/helpers/network/network_manager.dart';
import '../../authentication/models/user_model.dart';

class PostController extends GetxController {
  static PostController get instance => Get.find();
  final postRepository = Get.put(PostRepository());

  RxBool isLoading = false.obs;
  RxList<TutorPostModel> tutorPosts = <TutorPostModel>[].obs;
  RxList<StudentPostModel> studentPosts = <StudentPostModel>[].obs;
  RxList<UserModel> tutors = <UserModel>[].obs;
  RxList<TutorPostModel> filterPosts = <TutorPostModel>[].obs;
  // RxList<TutorPostModel> myPosts = <TutorPostModel>[].obs;
  RxString search = ''.obs;
  RxBool showStudentPosts = true.obs;
  RxBool isStudent = false.obs;

  @override
  void onInit() {
    fetchTutorPosts();
    fetchTutors();
    fetchStudentPosts();
    super.onInit();
  }

  Future<void> fetchAll() async {
    fetchTutorPosts();
    fetchTutors();
    fetchStudentPosts();
    print('Fetching');
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

  void fetchStudentPosts() async {
    try {
      isLoading.value = true;

      //fetch products
      final posts = await postRepository.getStudentPosts();

      print('Posts: $posts');

      //assign products
      studentPosts.assignAll(posts);
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

  //posts created by the user
  List<StudentPostModel> get myStudentPosts {
    return studentPosts
        .where(
            (post) => post.owner.id == Get.put(UserController()).user.value.id)
        .toList();
  }

  //delete the post when id given
  Future<void> deletePost(String id) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Deleting Post ...', 'assets/json/loader.json');

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //delete the post
      await postRepository.deletePost(id);

      // Fetch updated tutor posts
      fetchTutorPosts();

      //stop the loading
      TFullScreenLoader.stopLoading();

      //Show snack bar
      TLoaders.successSnackBar(
          title: 'Success', message: 'Post deleted successfully');
      Get.back();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  void togglePosts() {
    showStudentPosts.value = !showStudentPosts.value;
  }
}
