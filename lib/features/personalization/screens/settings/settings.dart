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
    final user = controller.user.value;

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
                  ListTile(
                    title: Text(
                      user.username,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .apply(color: Colors.white),
                    ),
                    trailing: IconButton(
                      onPressed: () => Get.to(() => const ProfileScreen()),
                      icon: Icon(Icons.settings, color: Color(0xFFFFFFFF)),
                    ),
                    leading: user.picture != null
                        ? CircleAvatar(
                            backgroundImage:
                                NetworkImage(controller.user.value.picture!),
                            radius: 20,
                          )
                        : null,
                  ),
                  const SizedBox(height: 16)
                ],
              )),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                SizedBox(height: 8),
                Text(
                  user.bio ?? 'No bio available',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(height: 16),
                NameFieldProfilePage(text: 'Username', input: user.username),
                SizedBox(height: 16),
                NameFieldProfilePage(text: 'Email', input: user.email),
                SizedBox(height: 16),
                NameFieldProfilePage(text: 'City', input: user.city),
                SizedBox(height: 16),
                NameFieldProfilePage(
                    text: 'Phone Number', input: user.phoneNumber),
                SizedBox(height: 16),
                IconFieldProfilePage(
                  icon: Icons.facebook,
                  input: user.socialLinkModel?.facebook,
                ),
                SizedBox(height: 16),
                IconFieldProfilePage(
                  icon: Icons.facebook,
                  input: user.socialLinkModel?.facebook,
                ),
                SizedBox(height: 16),
                IconFieldProfilePage(
                  icon: Icons.facebook,
                  input: user.socialLinkModel?.facebook,
                ),
                const Divider(),
                Column(
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
                        icon: Icons.info_outline_rounded,
                        title: 'Terms & Conditions'),

                    SettingsMenuTile(
                        onTap: () {},
                        icon: Icons.info_outline,
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
          )
        ],
      ),
    ));
  }
}
