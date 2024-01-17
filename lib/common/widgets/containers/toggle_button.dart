import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/findTutor/controllers/post_controller.dart';

class TwoPartedButton extends StatelessWidget {
  const TwoPartedButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PostController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0), // Make it rounded
        ),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  controller.showStudentPosts.value = true;
                },
                style: ElevatedButton.styleFrom(
                  primary: controller.showStudentPosts.value
                      ? Colors.blue // Change the color when selected
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                          16.0), // Make the first button's top-left rounded
                      bottomLeft: Radius.circular(
                          16.0), // Make the first button's bottom-left rounded
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Student Posts',
                    style: TextStyle(
                      color: controller.showStudentPosts.value
                          ? Colors.white
                          : Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 8.0), // Add space between the two parts
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  controller.showStudentPosts.value = false;
                },
                style: ElevatedButton.styleFrom(
                  primary: !controller.showStudentPosts.value
                      ? Colors.blue // Change the color when selected
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                          16.0), // Make the second button's top-right rounded
                      bottomRight: Radius.circular(
                          16.0), // Make the second button's bottom-right rounded
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Tutor Posts',
                    style: TextStyle(
                      color: !controller.showStudentPosts.value
                          ? Colors.white
                          : Colors.blue,
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
