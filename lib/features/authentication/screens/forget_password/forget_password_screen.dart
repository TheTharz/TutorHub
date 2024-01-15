import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tutorhub/features/authentication/controllers/forget_password/forget_password_controller.dart';

import '../../../../utils/validators/validation.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                      'assets/on_boarding_images/animationPageOne.json',
                      width: 300,
                      height: 300),
                  const SizedBox(height: 16),
                  Text(
                    'Forgot Password',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('An email will be sent to reset your password',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center),
                  ),

                  const SizedBox(height: 16),

                  Form(
                    key: controller.forgetPasswordFormKey,
                    child: TextFormField(
                      controller: controller.email,
                      validator: (value) => TValidator.validateEmail(value),
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',
                          hintText: 'Email'),
                    ),
                  ),

                  const SizedBox(
                      height: 32), // Add space between text and buttons
                  // Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      // onPressed: () => controller.logIn(),
                      onPressed: controller.sendPasswordResetEmail,
                      child: const Text('Send E-mail'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
