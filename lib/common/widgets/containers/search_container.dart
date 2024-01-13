import 'package:flutter/material.dart';

import '../../../utils/devices/device_utility.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.text,
    this.icon = Icons.search_outlined,
    this.showBackground = true,
    this.showBorder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    // final dark = TDeviceUtils.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: showBackground ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: showBorder ? Border.all(color: Colors.grey) : null),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey),
            const SizedBox(width: 20),
            Text(text, style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}
