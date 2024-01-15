import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
import '../../controllers/post_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostController());
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        const PrimaryHeaderContainer(
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
        SizedBox(height: 16),

        // gigs
        Obx(() {
          if (controller.isLoading.value) {
            return Center(
                child: CircularProgressIndicator(
                    color: TDeviceUtils.isDarkMode(context)
                        ? Colors.white
                        : Colors.black));
          }
          return Column(
            children: [
              const SectionHeading(
                title: 'Tutor Posts',
                showActionButton: false,
                textColor: Colors.black,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.tutorPosts.length,
                itemBuilder: (context, index) {
                  final post = controller.tutorPosts[index];
                  return GigCardVerical(
                    title: post.title,
                    imageUrl: post.image,
                    name: post.owner.username,
                    degree: post.degree,
                    experience: post.experience,
                    preferredMethod: post.preferredMethod,
                    hourlyPrice: post.hourlyPrice,
                    location: post.location,
                    dates: post.preferredDate,
                  );
                },
              ),
            ],
          );
        })
      ],
    )));
  }
}
