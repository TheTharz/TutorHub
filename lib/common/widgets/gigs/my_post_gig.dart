import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/common/styles/shadows.dart';
import 'package:tutorhub/common/widgets/containers/rounded_image.dart';
import 'package:tutorhub/features/findTutor/controllers/post_controller.dart';
import 'package:tutorhub/utils/constants/colors.dart';
import 'package:tutorhub/utils/devices/device_utility.dart';

class MyPostGigCardVerical extends StatelessWidget {
  const MyPostGigCardVerical(
      {super.key,
      required this.title,
      this.imageUrl = '',
      this.name = '',
      this.degree = '',
      this.experience = 0,
      this.preferredMethod = '',
      this.hourlyPrice = 0,
      this.location = '',
      this.dates = '',
      required this.id});

  final String title;
  final String imageUrl;
  final String name;
  final String degree;
  final int experience;
  final String preferredMethod;
  final int hourlyPrice;
  final String location;
  final String dates;
  final String id;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostController());
    return Container(
      width: TDeviceUtils.getScreenWidth(context),
      padding: const EdgeInsets.all(16), // Adjusted padding for better spacing
      decoration: BoxDecoration(
        boxShadow: [ShadowStyle.verticalGigShadow],
        borderRadius: BorderRadius.circular(24),
        color:
            TDeviceUtils.isDarkMode(context) ? TColors.darkGrey : Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Divider(),
          const SizedBox(height: 8),
          RoundedImage(
            isNetworkImage: true,
            imageUrl: imageUrl,
            width: 300,
            height: 200,
          ),
          SizedBox(height: 8),
          Row(
            children: [
              SizedBox(width: 16), // Adding space between the image and text
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  Text(
                    'By -$name',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(height: 4),
                  Text(degree, style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ],
          ),
          SizedBox(height: 16), // Adding space between the sections
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align text to the left
            children: [
              experience > 0
                  ? Text('$experience years of experience',
                      style: Theme.of(context).textTheme.titleMedium)
                  : Text('Newbie',
                      style: Theme.of(context).textTheme.titleMedium),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Align text to the left
                children: [
                  Text('$preferredMethod',
                      style: Theme.of(context).textTheme.titleMedium),
                  Text('LKR $hourlyPrice per hour',
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Spacing out the elements
                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      Text('Location - $location',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text('Dates - $dates',
                          style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  SizedBox(
                      width: 16), // Adding space between the text and button
                  TextButton(
                    onPressed: () {
                      controller.deleteStudentPost(id);
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white, // Text color
                      backgroundColor: Colors.red, // Background color
                      padding: EdgeInsets.all(
                          12), // Padding around the button content
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Button border radius
                      ),
                    ),
                    child: Text(
                      'Delete Post',
                      style: TextStyle(
                        fontSize: 16, // Text font size
                        fontWeight: FontWeight.bold, // Text font weight
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
