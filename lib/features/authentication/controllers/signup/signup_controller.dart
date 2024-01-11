import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/data/repositories/authentication/authentication_repository.dart';
import 'package:tutorhub/data/repositories/user/user_repository.dart';
import 'package:tutorhub/features/authentication/models/user_model.dart';
import 'package:tutorhub/features/authentication/screens/login/login.dart';
import 'package:tutorhub/utils/helpers/loader/loarder.dart';
import 'package:tutorhub/utils/helpers/network/network_manager.dart';

import '../../../../utils/helpers/loader/full_screen_loader.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //variables
  final hidePassword = true.obs;
  final hideConfirmPassword = true.obs;
  final privacyPolicy = false.obs;
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
          'We are processing your information ...', 'assets/json/loader.json');

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account,you must accept the privacy policy first');
        return;
      }

      //register user in the firebase authentication and save user data in the firestore
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save authenticated user data in the firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        email: email.text.trim(),
        // password: password.text.trim(),
        username: name.text.trim(),
        picture: '',
        city: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //show success message
      TLoaders.successSnackBar(
          title: 'Congratulations!', message: 'Your account has been created');

      //move to verify email screen
      Get.to(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();

      //show an error
      TLoaders.errorSnackBar(title: 'Oh snap!', message: e.toString());
    }
  }
}
