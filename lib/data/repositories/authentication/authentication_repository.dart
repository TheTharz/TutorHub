import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //called from main.dart on app launch

  //email and password sign in
  //email authentication - sign in

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
