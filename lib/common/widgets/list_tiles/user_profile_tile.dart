import 'package:flutter/material.dart';
import 'package:tutorhub/utils/constants/colors.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile(
      {super.key, required this.icon, required this.title, this.trailing});

  final IconData icon;
  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 28,
        color: TColors.primaryColor,
      ),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      trailing: trailing,
    );
  }
}
