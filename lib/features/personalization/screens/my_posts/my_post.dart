import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/common/widgets/gigs/my_post_gig.dart';
import 'package:tutorhub/common/widgets/gigs/my_post_student.dart';
import 'package:tutorhub/features/findTutor/controllers/post_controller.dart';

import '../../../../common/widgets/containers/primary_header_container.dart';
import '../../../../common/widgets/containers/toggle_button.dart';
import '../../../../common/widgets/gigs/gigs_vertical.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../../../utils/devices/device_utility.dart';
import '../../../findTutor/screens/home/widgets/home_appbar.dart';

class MyPostScreen extends StatelessWidget {
  const MyPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeaderContainer(
              height: 150,
              child: Column(
                children: [
                  //app bar
                  HomeAppBar(),
                  SizedBox(height: 16),
                ],
              ),
            ),
            SizedBox(height: 16),
            TwoPartedButton(controller: controller),
            // gigs
            Obx(() {
              if (controller.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(
                    color: TDeviceUtils.isDarkMode(context)
                        ? Colors.white
                        : Colors.black,
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    if (controller.showStudentPosts.value)
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.myStudentPosts.length,
                        itemBuilder: (context, index) {
                          final post = controller.myStudentPosts[index];
                          return Column(
                            children: [
                              MyStudentPost(
                                id: post.id,
                                title: post.title,
                                imageUrl: post.image,
                                name: post.owner.username,
                                preferredMethod: post.preferredMethod,
                                hourlyPrice: post.hourlyPrice,
                                location: post.location,
                                dates: post.preferredDate,
                              ),
                              const SizedBox(height: 16),
                            ],
                          );
                        },
                      )
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.myPosts.length,
                        itemBuilder: (context, index) {
                          final post = controller.myPosts[index];
                          return Column(
                            children: [
                              MyPostGigCardVerical(
                                id: post.id,
                                title: post.title,
                                imageUrl: post.image,
                                name: post.owner.username,
                                degree: post.degree,
                                experience: post.experience,
                                preferredMethod: post.preferredMethod,
                                hourlyPrice: post.hourlyPrice,
                                location: post.location,
                                dates: post.preferredDate,
                              ),
                              const SizedBox(height: 16),
                            ],
                          );
                        },
                      ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
