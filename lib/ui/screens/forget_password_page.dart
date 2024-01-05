import 'package:flutter/material.dart';
import 'package:tutorhub/ui/widgets/buttons/custom_solid_button.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/forgetpassword.png',
              width: 300, height: 300),
          const SizedBox(height: 16),
          Text(
            'Forgot Password',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'An email will be sent to tharind********952@gmail.com to reset your password',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center),
          ),

          const SizedBox(height: 32), // Add space between text and buttons
          CustomSolidButton(onPressed: () {}, text: 'Send OTP'),
        ],
      )),
    );
  }
}
