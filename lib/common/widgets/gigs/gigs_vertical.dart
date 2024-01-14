import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tutorhub/common/styles/shadows.dart';
import 'package:tutorhub/common/widgets/containers/rounded_image.dart';
import 'package:tutorhub/utils/constants/colors.dart';
import 'package:tutorhub/utils/devices/device_utility.dart';

class GigCardVerical extends StatelessWidget {
  const GigCardVerical(
      {super.key,
      required this.title,
      required this.imageUrl,
      required this.name,
      required this.degree,
      required this.experience,
      required this.online,
      required this.hourlyPrice,
      required this.location,
      required this.dates});

  final String title;
  final String imageUrl;
  final String name;
  final String degree;
  final int experience;
  final bool online;
  final double hourlyPrice;
  final String location;
  final String dates;

  @override
  Widget build(BuildContext context) {
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
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold, // Making the title bold
              fontSize: 18, // Adjusting the font size
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              RoundedImage(
                imageUrl: imageUrl,
                width: 100,
                height: 100,
              ),
              SizedBox(width: 16), // Adding space between the image and text
              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(degree),
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
                  ? Text('$experience of experience')
                  : Text('Newbie'),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Align text to the left
                children: [
                  online ? Text('Online') : Text('Physical'),
                  Text('LKR $hourlyPrice per hour'),
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
                      Text('Location - $location'),
                      Text('Dates - $dates'),
                    ],
                  ),
                  SizedBox(
                      width: 16), // Adding space between the text and button
                  TextButton(onPressed: () {}, child: Text('Chat Now')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
