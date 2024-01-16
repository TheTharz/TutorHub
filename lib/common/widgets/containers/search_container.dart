import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/features/findTutor/controllers/post_controller.dart';
import 'package:tutorhub/features/findTutor/screens/search_screen/search_screen.dart';

import '../../../utils/devices/device_utility.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Icons.search_outlined,
    this.showBackground = true,
    this.showBorder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    // final dark = TDeviceUtils.isDarkMode(context);
    final controller = Get.put(PostController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            color: showBackground ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: showBorder ? Border.all(color: Colors.grey) : null),
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.search_outlined),
                color: Colors.grey,
                onPressed: () {
                  Get.to(() => SearchScreen());
                }),
            const SizedBox(width: 2),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Type tutor name to find...',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                ),
                style: Theme.of(context).textTheme.bodySmall,
                onChanged: (value) {
                  // Handle the changed text here if needed
                  // Get.to(() => SearchScreen());
                  controller.searchPost(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
