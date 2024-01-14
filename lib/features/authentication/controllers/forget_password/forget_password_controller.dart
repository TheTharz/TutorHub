import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tutorhub/data/repositories/authentication/authentication_repository.dart';
import 'package:tutorhub/features/authentication/screens/forget_password/reset_password_screen.dart';
import 'package:tutorhub/utils/helpers/loader/full_screen_loader.dart';
import 'package:tutorhub/utils/helpers/loader/loarder.dart';

import '../../../../utils/helpers/network/network_manager.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //variables
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //send password reset email
  sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Prcessing Your Request...', 'assets/json/loader.json');
      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Email sent succesfully');

      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Prcessing Your Request...', 'assets/json/loader.json');
      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(title: 'Email sent succesfully');

      TLoaders.successSnackBar(title: 'Email has been sent');
    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
