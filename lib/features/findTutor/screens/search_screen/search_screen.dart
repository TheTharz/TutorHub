import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/common/widgets/containers/primary_header_container.dart';
import 'package:tutorhub/features/findTutor/screens/home/widgets/home_appbar.dart';

import '../../../../common/widgets/containers/search_container.dart';
import '../../../../common/widgets/gigs/gigs_vertical.dart';
import '../../controllers/post_controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PostController());
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
              () => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.filterPosts.length,
                itemBuilder: (context, index) {
                  final post = controller.filterPosts[index];
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
            ),
          ],
        )),
      ),
    );
  }
}
