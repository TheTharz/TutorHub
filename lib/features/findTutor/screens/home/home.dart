import 'package:flutter/material.dart';
import 'package:tutorhub/common/widgets/appbar/appbar.dart';
import 'package:tutorhub/common/widgets/curved_edges/curved_edges.dart';
import 'package:tutorhub/common/widgets/gigs/gigs_vertical.dart';
import 'package:tutorhub/features/findTutor/screens/home/widgets/home_appbar.dart';
import 'package:tutorhub/features/findTutor/screens/home/widgets/popular_tutor.dart';
import 'package:tutorhub/utils/constants/colors.dart';
import 'package:tutorhub/utils/devices/device_utility.dart';

import '../../../../common/widgets/containers/circular_container.dart';
import '../../../../common/widgets/containers/primary_header_container.dart';
import '../../../../common/widgets/containers/search_container.dart';
import '../../../../common/widgets/curved_edges/curved_edges_widget.dart';
import '../../../../common/widgets/image_text_widgets/verticle_image_with_text.dart';
import '../../../../common/widgets/notifications/notification_icon.dart';
import '../../../../common/widgets/text/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        PrimaryHeaderContainer(
            child: Column(
          children: [
            //app bar
            HomeAppBar(),

            SizedBox(height: 16),

            //searchbar
            SearchContainer(text: "Search for a tutor"),

            SizedBox(height: 16),

            // top teachers now
            Padding(
                padding: EdgeInsets.only(left: 24),
                child: Column(
                  children: [
                    SectionHeading(
                      title: 'Popular Tutors',
                      showActionButton: false,
                    ),
                    SizedBox(height: 24),
                    PopularTutors()
                  ],
                ))
          ],
        )),
        // gigs
        Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                //products
                GigCardVerical(
                  title: "OL Grade 11 Maths Classes",
                  imageUrl: 'assets/images/sample.jpg',
                  name: 'Sandun Bandara',
                  degree: 'Bsc in Maths',
                  experience: 8,
                  online: true,
                  hourlyPrice: 500.0,
                  location: 'Online',
                  dates: 'Flexible',
                ),
              ],
            ))
      ],
    )));
  }
}
