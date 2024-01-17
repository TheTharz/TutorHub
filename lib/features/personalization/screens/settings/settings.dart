import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:get/get.dart';
import 'package:tutorhub/common/widgets/containers/primary_header_container.dart';
import 'package:tutorhub/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:tutorhub/common/widgets/text/section_heading.dart';
import 'package:tutorhub/features/personalization/controllers/user_controller.dart';
import 'package:tutorhub/features/personalization/screens/profile/widgets/profile.dart';
import 'package:tutorhub/utils/constants/colors.dart';

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
                  'lahiru Madhuwantha',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: Color(0xFFFFFFFF)),
                ),
                trailing: IconButton(
                  onPressed: () => Get.to(() => const ProfileScreeen()),
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
              const SizedBox(height: 16)
            ],
          )),
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text('Name',
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis)),
                    Expanded(
                        child: Text('Lahiru Madhuwantha',
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis)),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text('Email',
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis)),
                    Expanded(
                        child: Text('lahirumadhuwantha293@gmail.com',
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis)),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text('Phone Number',
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis)),
                    Expanded(
                        child: Text('071 257 2356',
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis)),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text('Adress',
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis)),
                    Expanded(
                        child: Text('Dehimaduwa,Mawanella',
                            style: Theme.of(context).textTheme.bodyMedium,
                            overflow: TextOverflow.ellipsis)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Navigate to Facebook account
                          // Implement your navigation logic here
                        },
                        icon: Icon(Icons.facebook),
                        label: Text(''), // Set label to null
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Navigate to Facebook account
                          // Implement your navigation logic here
                        },
                        icon: Icon(Icons.facebook),
                        label: Text(''), // Set label to null
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Navigate to Facebook account
                          // Implement your navigation logic here
                        },
                        icon: Icon(Icons.facebook),
                        label: Text(''), // Set label to null
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(500),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
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
                    Row(),

                    SettingsMenuTile(
                        icon: Icons.info_outline_rounded,
                        title: 'Terms & Conditions'),
                    SettingsMenuTile(
                        icon: Icons.info_outline, title: 'About Tutor Hub'),
                    SettingsMenuTile(icon: Icons.logout, title: 'Log Out'),
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
