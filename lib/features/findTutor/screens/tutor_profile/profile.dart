import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:tutorhub/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:tutorhub/common/widgets/text/section_heading.dart';
import 'package:tutorhub/features/authentication/models/user_model.dart';
import 'package:tutorhub/features/personalization/controllers/user_controller.dart';
import 'package:tutorhub/features/personalization/screens/profile/widgets/profile.dart';
import 'package:tutorhub/features/personalization/screens/settings/widgets/icon_field_profile.dart';
import 'package:tutorhub/features/personalization/screens/settings/widgets/name_field_profile.dart';
import 'package:tutorhub/utils/constants/colors.dart';

import '../../../../common/widgets/containers/primary_header_container.dart';

class TutorProfile extends StatelessWidget {
  const TutorProfile({super.key, required this.tutor});
  final UserModel tutor;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          PrimaryHeaderContainer(
              height: 300,
              child: Column(
                children: [
                  AppBar(
                      title: Text('Account',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: TColors.light))),
                  const SizedBox(height: 16),
                  tutor.picture != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(tutor.picture!),
                          radius: 60,
                        )
                      : SizedBox(),

                  const SizedBox(height: 16),

                  Text(
                    tutor.username,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: Colors.white),
                  ),
                  // trailing: IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.settings, color: Color(0xFFFFFFFF)),
                  // ),

                  const SizedBox(height: 16)
                ],
              )),
          Padding(
            padding: EdgeInsets.all(8),
            child: Obx(
              () => Column(
                children: [
                  SizedBox(height: 8),
                  Text(
                    controller.user.value.bio ?? 'No bio available',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 16),
                  NameFieldProfilePage(
                      text: 'Username', input: controller.user.value.username),
                  SizedBox(height: 16),
                  NameFieldProfilePage(
                      text: 'Email', input: controller.user.value.email),
                  SizedBox(height: 16),
                  NameFieldProfilePage(
                      text: 'City', input: controller.user.value.city),
                  SizedBox(height: 16),
                  NameFieldProfilePage(
                      text: 'Phone Number',
                      input: controller.user.value.phoneNumber),
                  SizedBox(height: 16),
                  IconFieldProfilePage(
                    icon: Icons.facebook,
                    input: controller.user.value.socialLinkModel?.facebook,
                  ),
                  SizedBox(height: 16),
                  IconFieldProfilePage(
                    icon: Icons.facebook,
                    input: controller.user.value.socialLinkModel?.linkedin,
                  ),
                  SizedBox(height: 16),
                  IconFieldProfilePage(
                    icon: Icons.facebook,
                    input: controller.user.value.socialLinkModel?.facebook,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
