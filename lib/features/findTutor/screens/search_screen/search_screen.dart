import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/common/widgets/containers/primary_header_container.dart';
import 'package:tutorhub/common/widgets/gigs/student_gig_post.dart';
import 'package:tutorhub/features/findTutor/controllers/search_controller.dart';
import 'package:tutorhub/features/findTutor/screens/home/widgets/home_appbar.dart';

import '../../../../common/widgets/containers/search_container.dart';
import '../../../../common/widgets/gigs/gigs_vertical.dart';
import '../../../../common/widgets/image_text_widgets/verticle_image_with_text.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../controllers/post_controller.dart';
import '../tutor_profile/profile.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostController());
    final searchController = Get.put(QuerySearchController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            const PrimaryHeaderContainer(
                height: 200,
                child: Column(
                  children: [
                    HomeAppBar(),
                    SizedBox(height: 16),

                    //searchbar
                    SearchContainer(text: "Search for a tutor"),
                  ],
                )),
            SizedBox(height: 16),
            Obx(
              () => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    searchController.userSearchResut.length,
                    (index) {
                      final user = searchController.userSearchResut[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: VerticleImageText(
                          tutor: user,
                          image: user.picture!,
                          title: user.username,
                          onTap: () {
                            Get.to(() => TutorProfile(tutor: user));
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: searchController.studentpostSearchResult.length,
                itemBuilder: (context, index) {
                  final post = searchController.studentpostSearchResult[index];
                  return Column(
                    children: [
                      Text('Posts By Student',
                          style: Theme.of(context).textTheme.headlineMedium),
                      SizedBox(height: 16),
                      StudentGigCardVerical(
                        title: post.title,
                        imageUrl: post.image,
                        name: post.owner.username,
                        preferredMethod: post.preferredMethod,
                        hourlyPrice: post.hourlyPrice,
                        location: post.location,
                        dates: post.preferredDate,
                        subject: post.subject,
                      ),
                      SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ),
            Obx(
              () => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: searchController.tutorpostSearchResult.length,
                itemBuilder: (context, index) {
                  final post = searchController.tutorpostSearchResult[index];
                  return Column(
                    children: [
                      Text('Posts By Tutor',
                          style: Theme.of(context).textTheme.headlineMedium),
                      SizedBox(height: 16),
                      GigCardVerical(
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
                      SizedBox(height: 16),
                    ],
                  );
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
