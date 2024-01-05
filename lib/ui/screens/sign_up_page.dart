import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';
import 'package:tutorhub/ui/widgets/buttons/custom_solid_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevents overflow error
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text('Create Account',
                    style: Theme.of(context).textTheme.displayLarge),

                const SizedBox(height: 16),

                Text('Join Our Community With Only Few Steps...',
                    style: Theme.of(context).textTheme.bodyMedium),

                const SizedBox(height: 16),

                TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF1F4FF),
                    labelText: 'Username',
                  ),
                ),

                const SizedBox(height: 16),

                TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    filled: true,
                    fillColor: Color(0xFFF1F4FF),
                    labelText: 'E-mail',
                  ),
                ),

                const SizedBox(height: 16),

                TextFormField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF1F4FF),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                          icon: Icon(_obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          }),
                    )),

                const SizedBox(height: 16),

                TextFormField(
                    obscureText: _obscurePassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      filled: true,
                      fillColor: Color(0xFFF1F4FF),
                      labelText: 'Confirm Password',
                      suffixIcon: IconButton(
                          icon: Icon(_obscureConfirmPassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _obscureConfirmPassword =
                                  !_obscureConfirmPassword;
                            });
                          }),
                    )),

                const SizedBox(height: 16),

                // Button
                CustomSolidButton(onPressed: () {}, text: 'Sign Up'),

                const SizedBox(height: 16),

                // Text
                RichText(
                    text: TextSpan(
                        text: "Alread have an account? ",
                        style: Theme.of(context).textTheme.displaySmall,
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
                            style: Theme.of(context).textTheme.displaySmall),
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
    );
  }
}
