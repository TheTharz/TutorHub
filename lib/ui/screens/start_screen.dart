import 'package:flutter/material.dart';
import 'package:tutorhub/ui/widgets/buttons/custom_solid_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/start.png', width: 300, height: 300),
          const SizedBox(height: 16),
          Text(
            'Join the Learning Revolution',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                'Explore tutoring opportunities for personalized matches, flexible scheduling, and real-time progress tracking, empowering you to achieve academic success effortlessly.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center),
          ),

          const SizedBox(height: 32), // Add space between text and buttons
          CustomSolidButton(onPressed: () {}, text: 'Sign In'),
          const SizedBox(height: 8), // Add space between buttons
          SizedBox(
            width: 200,
            child: OutlinedButton(
              onPressed: () {
                // Handle sign up logic
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blue), // Outline color
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(color: Colors.blue), // Text color
              ),
            ),
          ),
        ],
      )),
    );
  }
}
