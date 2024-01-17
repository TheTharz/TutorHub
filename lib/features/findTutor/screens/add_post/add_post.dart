import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/common/widgets/containers/toggle_button.dart';
import 'package:tutorhub/features/findTutor/controllers/post_controller.dart';
import 'package:tutorhub/features/findTutor/controllers/upload_post_controller.dart';
import 'package:tutorhub/features/findTutor/screens/add_post/widgets/add_post_screen.dart';
import 'package:tutorhub/features/findTutor/screens/add_post/widgets/add_post_screen_user.dart';

import '../../../../utils/validators/validation.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadPostController());
    final secondController = Get.put(PostController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Obx(
            () => Column(
              children: [
                TwoPartedButton(controller: secondController),
                SizedBox(height: 16.0),
                !secondController.showStudentPosts.value
                    ? TutorPostAddScreen(controller: controller)
                    : UserPostUploadScreen(controller: controller)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
