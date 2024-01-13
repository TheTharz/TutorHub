import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tutorhub/features/authentication/screens/login/login.dart';
import 'package:tutorhub/features/authentication/screens/signup/signup.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //called from main.dart on app launch
  @override
  void onReady() {
    //remove the native splash
    //redirect to the appropriate screen
    screenRedirect();
  }

  //function to determine relevent screen and redirect
  void screenRedirect() async {
    final user = _auth.currentUser;
    final isFirstTime = deviceStorage.read('IsFirstTime') ?? true;

    if (user != null) {
      //if the user is logged in
      // Get.offAll(()=>const NavigationMenu());
    } else {
      //local storage
      deviceStorage.writeIfNull('IsFirstTime', false);

      //check if it's the first time launching the app
      if (isFirstTime) {
        // It's the first time launching the app, redirect to SignUpScreen
        Get.offAll(() => const SignUpScreen());
      } else {
        // Not the first time, redirect to LoginScreen
        Get.offAll(() => const LoginScreen());
      }
    }
  }

  //email and password sign in
  //email authentication - sign in
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw 'Error in loginWithEmailAndPassword: $e';
    }
  }

  //email authentication - register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } catch (e) {
      throw 'Error in registerWithEmailAndPassword: $e';
    }
  }

  //reauthentication - reauthentication user

  //email authentication - forgot password

  //google authentication - google sign in

  //logout user - for any authentication

  //delete user - remove user from firebase
}
