import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tutorhub/data/repositories/authentication/authentication_repository.dart';
import 'package:tutorhub/data/repositories/posts/post_repository.dart';
import 'package:tutorhub/features/findTutor/controllers/post_controller.dart';
import 'package:tutorhub/features/findTutor/models/user_post_model.dart';
import 'package:tutorhub/utils/helpers/loader/full_screen_loader.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/helpers/loader/loarder.dart';
import '../../../utils/helpers/network/network_manager.dart';
import '../../personalization/controllers/user_controller.dart';
import '../models/tutor_post_model.dart';

class UploadPostController extends GetxController {
  static UploadPostController get instance => Get.find();
  final postRepository = Get.put(PostRepository());
  final controller = Get.put(UserController());

  final title = TextEditingController();
  final password = TextEditingController();
  final description = TextEditingController();
  final subject = TextEditingController();
  final grade = TextEditingController();
  RxString image = ''.obs; // Using RxString for image to observe changes
  final hourlyPrice = TextEditingController();
  final location = TextEditingController();
  final preferredMethod = 'Online'.obs; // Using RxString for dropdown
  final preferredDate = 'Weekday'.obs; // Using RxString for dropdown
  final degree = TextEditingController();
  final experience = TextEditingController();

  void pickImage() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image.value = pickedImage.path;
    }
  }

  Future<void> uploadPost() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Uploading Post ...', 'assets/json/loader.json');

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //upload image first
      final imageLink =
          await UserRepository.instance.uploadImage('/postimages', image.value);

      //form validation

      //create a new tutorpostmodel object
      final tutorPost = TutorPostModel(
        id: '',
        title: title.text,
        description: description.text,
        subject: subject.text,
        grade: grade.text,
        image: imageLink,
        hourlyPrice: int.parse(hourlyPrice.text),
        location: location.text,
        owner: controller.user.value,
        preferredMethod: preferredMethod.value,
        preferredDate: preferredDate.value,
        degree: degree.text,
        experience: int.parse(experience.text),
      );

      //upload the post
      await postRepository.uploadPost(tutorPost);

      //fetch the new posts
      Get.find<PostController>().fetchTutorPosts();

      //stop the loading
      TFullScreenLoader.stopLoading();

      //Show snack bar
      TLoaders.successSnackBar(
          title: 'Success', message: 'Post uploaded successfully');
      Get.back();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<void> UploadUserPost() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Uploading Post ...', 'assets/json/loader.json');

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //upload image first
      final imageLink =
          await UserRepository.instance.uploadImage('/postimages', image.value);

      //form validation

      //create a new tutorpostmodel object
      final studentPost = StudentPostModel(
        id: '',
        title: title.text,
        description: description.text,
        subject: subject.text,
        grade: grade.text,
        image: imageLink,
        hourlyPrice: int.parse(hourlyPrice.text),
        location: location.text,
        owner: controller.user.value,
        preferredMethod: preferredMethod.value,
        preferredDate: preferredDate.value,
      );

      //upload the post
      await postRepository.uploadStudentPost(studentPost);

      //fetch the new posts
      Get.find<PostController>().fetchStudentPosts();

      //stop the loading
      TFullScreenLoader.stopLoading();

      //Show snack bar
      TLoaders.successSnackBar(
          title: 'Success', message: 'Post uploaded successfully');
      Get.back();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
