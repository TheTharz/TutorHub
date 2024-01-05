import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';
import 'package:tutorhub/ui/widgets/buttons/custom_solid_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscurePassword = true;
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
                Text('Let\'s sign in...',
                    style: Theme.of(context).textTheme.displayLarge),

                const SizedBox(height: 16),

                Text('Enter your credentials to login...',
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

                // forgot password
                Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        print("Forgot Password");
                      },
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Button
                CustomSolidButton(onPressed: () {}, text: 'Sign In'),

                const SizedBox(height: 16),

                // Text
                RichText(
                    text: TextSpan(
                        text: "Don't have an account? ",
                        style: Theme.of(context).textTheme.displaySmall,
                        children: [
                      TextSpan(
                        text: 'Sign Up',
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
                  child: const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.black54,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child:
                            Text("OR", style: TextStyle(color: Colors.black54)),
                      ),
                      Expanded(
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
                    btnText: 'Sign in with Google',
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
