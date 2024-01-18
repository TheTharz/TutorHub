import 'package:flutter/material.dart';

class IconFieldProfilePage extends StatelessWidget {
  const IconFieldProfilePage({
    Key? key,
    required this.icon,
    required this.input,
  }) : super(key: key);

  final IconData icon;
  final String? input;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 40, // Adjust the size as needed
          color: Theme.of(context).textTheme.bodyMedium!.color,
        ),
        SizedBox(width: 8), // Add some space between icon and text
        Expanded(
          child: Text(
            input ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
