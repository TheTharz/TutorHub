import 'package:flutter/material.dart';

class CustomSolidButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomSolidButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Background color
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white), // Text color
          ),
        ),
      ),
    );
  }
}
