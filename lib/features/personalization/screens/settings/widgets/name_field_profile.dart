import 'package:flutter/material.dart';

class NameFieldProfilePage extends StatelessWidget {
  const NameFieldProfilePage({
    super.key,
    required this.text,
    required this.input,
  });

  final String text;
  final String? input;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(text,
                style: Theme.of(context).textTheme.bodySmall,
                overflow: TextOverflow.ellipsis)),
        Expanded(
            child: Text(input!,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}
