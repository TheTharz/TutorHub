import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_button/sign_button.dart';
import 'package:tutorhub/features/authentication/controllers/login/login_controller.dart';
import 'package:tutorhub/features/authentication/screens/signup/signup.dart';
import 'package:tutorhub/utils/devices/device_utility.dart';

import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = TDeviceUtils.isDarkMode(context);
    final controller = Get.put(LogInController());

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false, // Prevents overflow error
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Let\'s Sign In...',
                      style: Theme.of(context).textTheme.headlineLarge),

                  const SizedBox(height: 16),

                  Text('Join Our Community With Only Few Steps...',
                      style: Theme.of(context).textTheme.bodySmall),

                  const SizedBox(height: 16),

                  LogInForm(),

                  const SizedBox(height: 16),

                  // Divider with line
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            color: Colors.black54,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text("Or Continue With",
                              style: Theme.of(context).textTheme.labelSmall),
                        ),
                        const Expanded(
                          child: Divider(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  SignInButton(
                      buttonType: ButtonType.google,
                      btnText: 'Sign In With Google',
                      onPressed: () {
                        controller.googleSignIn();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
