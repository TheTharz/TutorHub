import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';
import 'package:tutorhub/utils/devices/device_utility.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool _obscurePassword = true;
    final dark = TDeviceUtils.isDarkMode(context);

    return Scaffold(
      resizeToAvoidBottomInset: false, // Prevents overflow error
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                //header
                Text('Let\'s sign in...',
                    style: Theme.of(context).textTheme.displayLarge),

                const SizedBox(height: 16),

                Text('Enter your credentials to login...',
                    style: Theme.of(context).textTheme.bodyMedium),

                const SizedBox(height: 16),

                //forms
                Form(
                    child: Column(
                  children: [
                    // Email
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',
                          hintText: 'Enter your email'),
                    ),

                    const SizedBox(
                      height: 16,
                    ),

                    //password
                    TextFormField(
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          suffixIcon: Icon(Icons.visibility_off)),
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    // Remember me and forget password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //remember me
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            Text('Remember me',
                                style: Theme.of(context).textTheme.labelSmall)
                          ],
                        ),

                        //forget password
                        TextButton(
                          onPressed: () {},
                          child: Text('Forget password?',
                              style: Theme.of(context).textTheme.labelSmall),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),

                    //sign in button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Sign In'),
                      ),
                    ),

                    const SizedBox(height: 4),

                    //create account button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: const Text('Create Account'),
                      ),
                    )
                  ],
                )),

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
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("OR",
                            style: Theme.of(context).textTheme.bodySmall),
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
