import 'package:flutter/material.dart';
import 'package:tutorhub/ui/widgets/buttons/custom_solid_button.dart';

class ResetPasswordSuccessPage extends StatelessWidget {
  const ResetPasswordSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/star.png', width: 300, height: 200),

            Text(
              'Password Changed',
              style: Theme.of(context).textTheme.displayMedium,
            ),

            const SizedBox(height: 16),

            Text(
              'Your password has been changed succesfully',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 16),

            // Add space between text and buttons
            CustomSolidButton(onPressed: () {}, text: 'Back To Log In'),
          ],
        )),
      ),
    );
  }
}
