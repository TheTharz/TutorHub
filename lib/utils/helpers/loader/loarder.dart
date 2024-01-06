import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TLoaders {
  static void warningSnackBar({required String title, message = ''}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.warning),
    );
  }

  static void successSnackBar({required String title, message = ''}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.check),
    );
  }

  static void errorSnackBar({required String title, message = ''}) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.error),
    );
  }
}
