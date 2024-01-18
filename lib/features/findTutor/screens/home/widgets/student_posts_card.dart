import 'package:flutter/material.dart';

import '../../../../../common/widgets/gigs/student_gig_post.dart';
import '../../../../../common/widgets/text/section_heading.dart';
import '../../../../../utils/devices/device_utility.dart';
import '../../../controllers/post_controller.dart';

class StudentPostsCard extends StatelessWidget {
  const StudentPostsCard({
    super.key,
    required this.controller,
  });

  final PostController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.studentPosts.length,
          itemBuilder: (context, index) {
            final post = controller.studentPosts[index];
            print('The phone number is' + post.owner.phoneNumber.toString());
            return Column(
              children: [
                const SizedBox(height: 20),
                StudentGigCardVerical(
                  title: post.title,
                  imageUrl: post.image,
                  name: post.owner.username,
                  preferredMethod: post.preferredMethod,
                  hourlyPrice: post.hourlyPrice,
                  location: post.location,
                  dates: post.preferredDate,
                  phoneNumber: post.owner.phoneNumber.toString(),
                  subject: post.subject,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
