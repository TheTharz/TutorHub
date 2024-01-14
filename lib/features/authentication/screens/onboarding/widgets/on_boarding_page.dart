import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tutorhub/utils/devices/device_utility.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.url,
    required this.heading,
    required this.subHeading,
  });

  final String url;
  final String heading;
  final String subHeading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Lottie.asset(
            url, // Replace with your Lottie JSON file path
            width: TDeviceUtils.getScreenWidth(context) * 0.8,
            height: TDeviceUtils.getScreenHeight() * 0.6,
          ),
          Text(
            heading,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(subHeading,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
