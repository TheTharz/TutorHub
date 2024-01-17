import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tutorhub/data/repositories/authentication/authentication_repository.dart';
import 'package:tutorhub/data/repositories/user/user_repository.dart';
import 'package:tutorhub/features/authentication/models/user_model.dart';
import 'package:tutorhub/features/personalization/screens/profile/widgets/profile.dart';
import 'package:tutorhub/features/personalization/screens/settings/settings.dart';
import 'package:tutorhub/utils/helpers/loader/loarder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/helpers/loader/full_screen_loader.dart';
import '../../../utils/helpers/network/network_manager.dart';
import '../../authentication/models/social_link_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;

  bool isSelectedImage = false;

  final username = TextEditingController();
  final phoneNumber = TextEditingController();
  final bio = TextEditingController();
  final name = TextEditingController();
  final address = TextEditingController();
  final city = TextEditingController();
  final facebook = TextEditingController();
  final linkedin = TextEditingController();
  final twitter = TextEditingController();
  // final picture = TextEditingController();
  final email = TextEditingController();
  final id = TextEditingController();
  RxString image = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  void initWithCurrentUser() {
    UserModel currentUser = user.value;

    username.text = currentUser.username;
    phoneNumber.text = currentUser.phoneNumber ?? "";
    bio.text = currentUser.bio ?? '';
    address.text = currentUser.address ?? '';
    city.text = currentUser.city ?? '';
    facebook.text = currentUser.socialLinkModel?.facebook ?? '';
    linkedin.text = currentUser.socialLinkModel?.linkedin ?? '';
    twitter.text = currentUser.socialLinkModel?.twitter ?? '';
    image.value = currentUser.picture ?? '';
    email.text = currentUser.email;
    id.text = currentUser.id;
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
      //refresh user record
      // await fetchUserRecord();

      if (userCredential != null) {
        final username = userCredential.user?.displayName ?? '';

        final user = UserModel(
          id: userCredential.user!.uid,
          email: userCredential.user!.email ?? '',
          username: username,
          picture: userCredential.user!.photoURL ?? '',
          city: '',
          phoneNumber: '',
        );
        //save user data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      TLoaders.warningSnackBar(
          title: 'Data not saved',
          message: 'Something went wrong while saving your information.');
    }
  }

  //upload profile Picture
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        //upload image to firebase storage
        final storageRef = await userRepository.uploadImage(
            'Users/Images/Profile', image.name);
        //update user profile picture
        await userRepository.updateSingleField({'picture': storageRef});
        //refresh user record
        await fetchUserRecord();
        print('image uploaded');
      }
    } catch (e) {}
  }

  Future<void> launchUrl(url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      throw Exception('Could not launch $url');
    }
  }

  //logout
  Future<void> logout() async {
    try {
      await AuthenticationRepository.instance.logout();
    } catch (e) {}
  }

  //update user
  Future<void> updateUser() async {
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
      if (!GetUtils.isUsername(username.text.trim())) {
        TLoaders.warningSnackBar(
            title: 'Invalid username',
            message: 'Please enter a valid username');
        TFullScreenLoader.stopLoading();
        return;
      }

      //save user data
      final user = UserModel(
        id: id.text.trim(),
        email: email.text.trim(),
        username: username.text.trim(),
        picture: image.value,
        city: city.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        socialLinkModel: SocialLinkModel(
          facebook: facebook.text.trim(),
          linkedin: linkedin.text.trim(),
          twitter: twitter.text.trim(),
        ),
        bio: bio.text.trim(),
        address: address.text.trim(),
      );

      await userRepository.updateUserDetails(user);

      //refresh user record
      await fetchUserRecord();
      //

      //show success message
      TLoaders.successSnackBar(
          title: 'Congratulations!', message: 'Your profile has been updated');

      //close loading
      TFullScreenLoader.stopLoading();
    } catch (e) {}
  }

  void pickImage() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image.value = pickedImage.path;
    }

    //upload image to firebase storage
    image.value =
        await userRepository.uploadImage('Users/Images/Profile', image.value);
  }
}
