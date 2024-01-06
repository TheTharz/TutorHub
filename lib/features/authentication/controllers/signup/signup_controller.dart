import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/utils/helpers/loader/loarder.dart';
import 'package:tutorhub/utils/helpers/network/network_manager.dart';

import '../../../../utils/helpers/loader/full_screen_loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //variables
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //signup
  Future<void> signUp() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information ...', 'loader.json');

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!signupFormKey.currentState!.validate()) {
        // TFullScreenLoader.stopLoading();
        return;
      }

      //privacy policy check

      //register user in the firebase authentication and save user data in the firestore

      //save authenticated user data in the firebase firestore

      //show success message

      //move to verify email screen
    } catch (e) {
      //show an error
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    } finally {
      //remove loader
      TFullScreenLoader.stopLoading();
    }
  }
}
