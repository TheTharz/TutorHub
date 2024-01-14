import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tutorhub/features/authentication/screens/login/login.dart';
import 'package:tutorhub/features/authentication/screens/signup/signup.dart';
import 'package:tutorhub/features/findTutor/screens/home/home.dart';

import '../../../navigation_menu.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //Get authenticated user data
  User? get authUser => _auth.currentUser;

  //called from main.dart on app launch
  @override
  void onReady() {
    //remove the native splash
    //redirect to the appropriate screen
    screenRedirect();
  }

  //function to determine relevent screen and redirect
  void screenRedirect() async {
    // final user = _auth.currentUser;
    // final isFirstTime = deviceStorage.read('IsFirstTime') ?? true;

    // if (user != null) {
    //   //if the user is logged in
    //   Get.offAll(() => const NavigationMenu());
    //   // Get.to(const HomeScreen());
    // } else {
    //   //local storage
    //   deviceStorage.writeIfNull('IsFirstTime', false);

    //   //check if it's the first time launching the app
    //   if (isFirstTime) {
    //     // It's the first time launching the app, redirect to SignUpScreen
    //     Get.offAll(() => const SignUpScreen());
    //   } else {
    //     // Not the first time, redirect to LoginScreen
    //     Get.offAll(() => const LoginScreen());
    //   }
    // }
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
  Future<UserCredential> signInWithGoogle() async {
    try {
      //trigger authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      //obtain the auth details fron the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      //create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      //once signed in return the usercredential
      return await _auth.signInWithCredential(credentials);
    } catch (e) {
      throw 'Error in registerWithEmailAndPassword: $e';
    }
  }

  //logout user - for any authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(const LoginScreen());
    } catch (e) {
      throw 'Error in registerWithEmailAndPassword: $e';
    }
  }

  //delete user - remove user from firebase
}
