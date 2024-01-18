import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tutorhub/features/authentication/controllers/login/login_controller.dart';

import 'package:tutorhub/features/authentication/screens/signup/signup.dart';

import '../../../../../utils/validators/validation.dart';
import '../../forget_password/forget_password_screen.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());

    return Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value ?? ''),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  hintText: 'Email'),
            ),

            const SizedBox(height: 16),

            Obx(() => TextFormField(
                  controller: controller.password,
                  validator: (value) =>
                      TValidator.validatePassword(value ?? ''),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      labelText: 'Password',
                      hintText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility))),
                )),

            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx(() => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) {
                          controller.rememberMe.value =
                              !controller.rememberMe.value;
                        })),
                    const Text('Remember Me'),
                    const SizedBox(width: 16),
                    GestureDetector(
                      onTap: () => Get.to(() => ForgetPasswordScreen()),
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.logIn(),
                // onPressed: () => Get.to(() => NavigationMenu()),
                child: const Text('Log In'),
              ),
            ),

            const SizedBox(height: 16),

            // Text
            RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: Theme.of(context).textTheme.labelSmall,
                children: [
                  TextSpan(
                    text: 'Create Account',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.to(() => const SignUpScreen());
                      },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
