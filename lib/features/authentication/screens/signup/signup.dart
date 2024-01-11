import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:tutorhub/features/authentication/screens/signup/widgets/signup_form.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false, // Prevents overflow error
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Create Account',
                      style: Theme.of(context).textTheme.headlineLarge),

                  const SizedBox(height: 16),

                  Text('Join Our Community With Only Few Steps...',
                      style: Theme.of(context).textTheme.bodySmall),

                  const SizedBox(height: 16),

                  const SizedBox(height: 16),

                  const SignUpForm(),

                  const SizedBox(height: 16),

                  // Text
                  RichText(
                      text: TextSpan(
                          text: "Alread have an account? ",
                          style: Theme.of(context).textTheme.labelSmall,
                          children: [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // TODO: Implement the Sign In logic here
                              // Navigate to the Sign In screen
                            },
                        ),
                      ])),

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
                      btnText: 'Sign Up With Google',
                      onPressed: () {
                        print('click');
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
