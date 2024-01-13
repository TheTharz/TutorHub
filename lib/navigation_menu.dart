import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  icon: Icon(Icons.chat_bubble_outline_outlined),
                  label: 'Chat'),
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
    Container(color: Colors.amber),
    Container(color: Colors.blue),
    Container(color: Colors.green),
    Container(color: Colors.pink),
    Container(color: Colors.red),
  ];
}
