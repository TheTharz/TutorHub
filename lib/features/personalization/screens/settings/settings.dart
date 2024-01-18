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

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          PrimaryHeaderContainer(
              height: 200,
              child: Column(
                children: [
                  AppBar(
                      title: Text('Account',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: TColors.light))),
                  const SizedBox(height: 16),
                  Obx(
                    () => ListTile(
                      title: Text(
                        controller.user.value.username,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: Colors.white),
                      ),
                      trailing: IconButton(
                        onPressed: () => Get.to(() => const ProfileScreen()),
                        icon: Icon(Icons.settings, color: Color(0xFFFFFFFF)),
                      ),
                      leading: controller.user.value.picture != null
                          ? CircleAvatar(
                              backgroundImage:
                                  NetworkImage(controller.user.value.picture!),
                              radius: 20,
                            )
                          : null,
                    ),
                  ),
                  const SizedBox(height: 16)
                ],
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
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
                    icon: Icons.camera_alt,
                    input: controller.user.value.socialLinkModel?.linkedin,
                  ),
                  SizedBox(height: 16),
                  IconFieldProfilePage(
                    icon: Icons.linked_camera,
                    input: controller.user.value.socialLinkModel?.facebook,
                  ),
                  const Divider(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // SettingsMenuTile(
                      //   icon: Icons.notifications,
                      //   title: 'Notifications',
                      //   trailing: Switch(
                      //     value: true,
                      //     onChanged: (value) {},
                      //   ),
                      // ),
                      SettingsMenuTile(
                          onTap: () {},
                          icon: Icons.privacy_tip_outlined,
                          title: 'Privacy & Security'),

                      SettingsMenuTile(
                          onTap: () {},
                          icon: Icons.info_outline,
                          title: 'Terms & Conditions'),

                      SettingsMenuTile(
                          onTap: () {},
                          icon: Icons.data_exploration_sharp,
                          title: 'About Tutor Hub'),
                      SettingsMenuTile(
                          onTap: () {
                            controller.logout();
                          },
                          icon: Icons.logout,
                          title: 'Log Out'),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
