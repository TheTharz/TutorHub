import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/findTutor/controllers/post_controller.dart';

class TwoPartedButton extends StatelessWidget {
  const TwoPartedButton({
    super.key,
    required this.controller,
  });

  final PostController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.blue), // Add border for visual separation
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  controller.showStudentPosts.value = true;
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  color: controller.showStudentPosts.value
                      ? Colors.blue // Change the color when selected
                      : Colors.white,
                  child: Center(
                    child: Text(
                      'Student Posts',
                      style: TextStyle(
                        color: controller.showStudentPosts.value
                            ? Colors
                                .white // Change the text color when selected
                            : Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.0), // Add space between the two parts
            Expanded(
              child: InkWell(
                onTap: () {
                  controller.showStudentPosts.value = false;
                },
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  color: !controller.showStudentPosts.value
                      ? Colors.blue // Change the color when selected
                      : Colors.white,
                  child: Center(
                    child: Text(
                      'Tutor Posts',
                      style: TextStyle(
                        color: !controller.showStudentPosts.value
                            ? Colors
                                .white // Change the text color when selected
                            : Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
