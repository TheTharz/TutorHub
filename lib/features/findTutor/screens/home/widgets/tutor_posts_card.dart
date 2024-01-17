import 'package:flutter/material.dart';

import '../../../../../common/widgets/gigs/gigs_vertical.dart';
import '../../../../../common/widgets/text/section_heading.dart';
import '../../../../../utils/devices/device_utility.dart';
import '../../../controllers/post_controller.dart';

class TutorPostsCard extends StatelessWidget {
  const TutorPostsCard({
    super.key,
    required this.controller,
  });

  final PostController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeading(
          title: 'Tutor Posts',
          showActionButton: false,
          textColor:
              TDeviceUtils.isDarkMode(context) ? Colors.white : Colors.black,
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
              phoneNumber: post.owner.phoneNumber.toString(),
            );
          },
        ),
      ],
    );
  }
}
