import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/features/findTutor/screens/add_post/add_post.dart';
import 'package:tutorhub/features/findTutor/screens/home/home.dart';
import 'package:tutorhub/features/findTutor/screens/search_screen/search_screen.dart';
import 'package:tutorhub/features/personalization/screens/my_posts/my_post.dart';
import 'package:tutorhub/features/personalization/screens/profile/widgets/profile.dart';
import 'package:tutorhub/features/personalization/screens/settings/settings.dart';
import 'package:tutorhub/utils/devices/device_utility.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = TDeviceUtils.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            backgroundColor: darkMode ? Colors.black : Colors.white,
            indicatorColor: darkMode
                ? Colors.white.withOpacity(0.1)
                : Colors.black.withOpacity(0.1),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.search_outlined), label: 'Search'),
              NavigationDestination(
                  icon: Icon(Icons.add_circle_outline), label: 'Add'),
              NavigationDestination(
                  icon: Icon(Icons.post_add_outlined), label: 'My Posts'),
              NavigationDestination(
                  icon: Icon(Icons.person_outline), label: 'Profile'),
            ]),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const SearchScreen(),
    const AddPostScreen(),
    const MyPostScreen(),
    const SettingsScreen(),
  ];
}
