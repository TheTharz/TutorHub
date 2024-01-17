import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tutorhub/common/styles/shadows.dart';
import 'package:tutorhub/common/widgets/containers/rounded_image.dart';
import 'package:tutorhub/utils/constants/colors.dart';
import 'package:tutorhub/utils/devices/device_utility.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentGigCardVerical extends StatelessWidget {
  const StudentGigCardVerical({
    super.key,
    required this.title,
    this.imageUrl = '',
    this.name = '',
    this.preferredMethod = '',
    this.hourlyPrice = 0,
    this.location = '',
    this.dates = '',
    this.phoneNumber = '',
  });

  final String title;
  final String imageUrl;
  final String name;

  final String preferredMethod;
  final int hourlyPrice;
  final String location;
  final String dates;
  final String phoneNumber;

  final String _url = 'http://via.placeholder.com/350x150';

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
          RoundedImage(
            isNetworkImage: true,
            imageUrl: imageUrl,
            width: 100,
            height: 100,
          ),

          SizedBox(height: 16), // Adding space between the sections
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align text to the left
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween, // Align text to the left
                children: [
                  Text('$preferredMethod'),
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
                  Row(
                    children: [
                      if (phoneNumber
                          .isNotEmpty) // Check if phone number is not an empty string
                        IconButton(
                          onPressed: () async {
                            print('Calling now: $phoneNumber');
                            final _call = 'tel:$phoneNumber';
                            if (await canLaunch(_call)) {
                              await launch(_call);
                            }
                          },
                          icon: Icon(Icons.call),
                          tooltip: 'Call Now',
                        ),
                      SizedBox(width: 16), // Adjust the space between buttons
                      if (phoneNumber
                          .isNotEmpty) // Check if phone number is not an empty string
                        IconButton(
                          onPressed: () async {
                            print('Chatting with now: $phoneNumber');
                            final _text = 'sms:$phoneNumber';
                            if (await canLaunch(_text)) {
                              await launch(_text);
                            }
                          },
                          icon: Icon(Icons.message),
                          tooltip: 'Chat Now',
                        ),
                    ],
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
