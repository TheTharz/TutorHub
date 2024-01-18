import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tutorhub/features/personalization/controllers/user_controller.dart';
import 'package:tutorhub/navigation_menu.dart';

import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/helpers/loader/full_screen_loader.dart';
import '../../../../utils/helpers/loader/loarder.dart';
import '../../../../utils/helpers/network/network_manager.dart';

class LogInController extends GetxController {
  static LogInController get instance => Get.find();
  final userController = Get.put(UserController());

  /// variables
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  final rememberMe = true.obs;

  final localStorage = GetStorage();

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  /// --Email and password sign in
  Future<void> logIn() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'Logging You In ...', 'assets/json/loader.json');

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

      // save data if remember me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //show success message
      TLoaders.successSnackBar(
          title: 'Congratulations!', message: 'You have sucessfully logged in');

      TFullScreenLoader.stopLoading();

      //redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();

      //show an error
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }

  //google singin authentication
  Future<void> googleSignIn() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'Logging You In ...', 'assets/json/loader.json');

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //google authentication
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      //save user records
      userController.saveUserRecord(userCredentials);

      //stop the loader
      TFullScreenLoader.stopLoading();

      //redirecting the screen
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();

      //show an error
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
