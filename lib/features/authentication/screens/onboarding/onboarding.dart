import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tutorhub/features/authentication/controllers.onboarding/onboarding_controllers.dart';
import 'package:tutorhub/features/authentication/screens/onboarding/widgets/on_boarding_page.dart';
import 'package:tutorhub/utils/constants/colors.dart';
import 'package:tutorhub/utils/devices/device_utility.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
        body: Stack(
      children: [
        //horizontal scrollable pages
        PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                  url: 'assets/on_boarding_images/animationPageOne.json',
                  heading: 'lorem ipsum dolor sit amet',
                  subHeading: 'lorem ipsum dolor sit amet'),
              OnBoardingPage(
                  url: 'assets/on_boarding_images/animationPageTwo.json',
                  heading: 'lorem ipsum dolor sit amet',
                  subHeading: 'lorem ipsum dolor sit amet'),
              OnBoardingPage(
                  url: 'assets/on_boarding_images/animationPageThree.json',
                  heading: 'lorem ipsum dolor sit amet',
                  subHeading: 'lorem ipsum dolor sit amet')
            ]),

        //skip button
        Positioned(
            top: TDeviceUtils.getAppBarHeight(),
            right: 8,
            child: TextButton(
                onPressed: controller.skipPage, child: const Text('Skip'))),

        //dot navigation smoothpageindicator
        Positioned(
            bottom: TDeviceUtils.getBottomNavigationBarHeight(),
            left: 16,
            child: SmoothPageIndicator(
              controller: controller.pageController,
              onDotClicked: controller.dotNavigationClick,
              count: 3,
              effect: ExpandingDotsEffect(
                  activeDotColor: TDeviceUtils.isDarkMode(context)
                      ? TColors.light
                      : TColors.dark),
            )),

        //circular button
        Positioned(
          right: 16,
          bottom: TDeviceUtils.getBottomNavigationBarHeight(),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: TDeviceUtils.isDarkMode(context)
                      ? TColors.primaryColor
                      : Colors.black),
              onPressed: controller.nextPage,
              child: const Icon(Icons.arrow_circle_right_sharp)),
        )
      ],
    ));
  }
}
