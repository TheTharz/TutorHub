import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/helpers/loader/full_screen_loader.dart';
import '../../../../utils/helpers/loader/loarder.dart';
import '../../../../utils/helpers/network/network_manager.dart';

class LogInController extends GetxController {
  static LogInController get instance => Get.find();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;

  Future<void> logIn() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information ...', 'assets/json/loader.json');

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final userCredential = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //show success message
      TLoaders.successSnackBar(
          title: 'Congratulations!', message: 'You have sucessfully logged in');
    } catch (e) {
      TFullScreenLoader.stopLoading();

      //show an error
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
