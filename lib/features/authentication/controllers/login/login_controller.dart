import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  static LogInController get instance => Get.find();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;

  Future<void> logIn() async {}
}
