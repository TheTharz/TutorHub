import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:tutorhub/data/repositories/user/user_repository.dart';
import 'package:tutorhub/features/authentication/models/user_model.dart';
import 'package:tutorhub/utils/helpers/loader/loarder.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //fetch user record
  Future<void> fetchUserRecord() async {
    try {
      final user = await userRepository.fetchUseDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    }
  }

  //save user record from any registration provider
  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final username = userCredential.user?.displayName ?? '';

        final user = UserModel(
            id: userCredential.user!.uid,
            email: userCredential.user!.email ?? '',
            username: username,
            picture: userCredential.user!.photoURL ?? '',
            city: '');
        //save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message: 'Something went wrong while saving your information.');
    }
  }
}
