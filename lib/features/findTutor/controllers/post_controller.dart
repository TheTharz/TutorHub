import 'package:get/get.dart';
import 'package:tutorhub/data/repositories/posts/post_repository.dart';
import 'package:tutorhub/features/findTutor/models/tutor_post_model.dart';
import 'package:tutorhub/utils/helpers/loader/loarder.dart';

class PostController extends GetxController {
  static PostController get instance => Get.find();
  final postRepository = Get.put(PostRepository());

  RxBool isLoading = false.obs;
  RxList<TutorPostModel> tutorPosts = <TutorPostModel>[].obs;

  @override
  void onInit() {
    fetchTutorPosts();
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
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
