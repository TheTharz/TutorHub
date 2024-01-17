import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/common/widgets/appbar/appbar.dart';
import 'package:tutorhub/common/widgets/curved_edges/curved_edges.dart';
import 'package:tutorhub/common/widgets/gigs/gigs_vertical.dart';
import 'package:tutorhub/common/widgets/gigs/student_gig_post.dart';
import 'package:tutorhub/features/findTutor/screens/home/widgets/home_appbar.dart';
import 'package:tutorhub/features/findTutor/screens/home/widgets/popular_tutor.dart';
import 'package:tutorhub/features/findTutor/screens/tutor_profile/profile.dart';
import 'package:tutorhub/utils/constants/colors.dart';
import 'package:tutorhub/utils/devices/device_utility.dart';

import '../../../../common/widgets/containers/circular_container.dart';
import '../../../../common/widgets/containers/primary_header_container.dart';
import '../../../../common/widgets/containers/search_container.dart';
import '../../../../common/widgets/containers/toggle_button.dart';
import '../../../../common/widgets/curved_edges/curved_edges_widget.dart';
import '../../../../common/widgets/image_text_widgets/verticle_image_with_text.dart';
import '../../../../common/widgets/notifications/notification_icon.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../controllers/post_controller.dart';
import 'widgets/student_posts_card.dart';
import 'widgets/tutor_posts_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostController());

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: controller.fetchAll,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              PrimaryHeaderContainer(
                height: 400,
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
                            title: 'Popular Users Of Us...',
                            showActionButton: false,
                          ),
                          SizedBox(height: 24),
                          Obx(() => SizedBox(
                                height: 150,
                                child: ListView.builder(
                                  itemCount: controller.tutors.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    final tutor = controller.tutors[index];
                                    print(tutor.username);
                                    return VerticleImageText(
                                      tutor: tutor,
                                      image: tutor.picture!,
                                      title: tutor.username,
                                      onTap: () {
                                        Get.to(
                                            () => TutorProfile(tutor: tutor));
                                      },
                                    );
                                  },
                                ),
                              )),
                        ],
                      ),
                    ),
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
                if (controller.showStudentPosts.value) {
                  return StudentPostsCard(controller: controller);
                } else {
                  return TutorPostsCard(controller: controller);
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
