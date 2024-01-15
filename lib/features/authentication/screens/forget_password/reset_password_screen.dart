import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:tutorhub/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:tutorhub/features/authentication/screens/login/login.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/on_boarding_images/animationPageThree.json',
                width: 300, height: 300),
            const SizedBox(height: 16),
            Text(
              'Forgot Password',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  'An email will be sent to $email to reset your password',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center),
            ),

            const SizedBox(height: 32), // Add space between text and buttons
            // Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                // onPressed: () => controller.logIn(),
                onPressed: () => Get.offAll(() => const LoginScreen()),
                child: const Text('Done'),
              ),
            ),

            const SizedBox(height: 16), // Add space between text and buttons

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                // onPressed: () => controller.logIn(),
                onPressed: () => ForgetPasswordController.instance
                    .resendPasswordResetEmail(email),
                child: const Text('Resend Email'),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
