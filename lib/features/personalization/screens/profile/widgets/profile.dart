import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/common/widgets/text/section_heading.dart';
import 'package:tutorhub/features/personalization/controllers/user_controller.dart';

class ProfileScreeen extends StatelessWidget {
  const ProfileScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
        appBar: AppBar(title: Text('Profile Settings')),

        /// Body
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        if (controller.user.value.picture != null)
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(controller.user.value.picture!),
                            radius: 20,
                          ),
                        SizedBox(width: 8),
                        TextButton(
                            onPressed: () {},
                            child: const Text('Change Profile Picture')),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Divider(),
                  const SizedBox(height: 12),
                  const SectionHeading(
                      title: 'Edit Your Profile', showActionButton: false),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.edit),
                      labelText: 'User Name',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.edit),
                      labelText: 'Phone Number',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.edit),
                      labelText: 'Bio',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.edit),
                      labelText: 'Adress',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.edit),
                      labelText: 'Facebook',
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.edit),
                      labelText: 'LinkedIn',
                    ),
                  ),

                  SizedBox(height: 8.0),
                  // ... (other text fields)
                  ElevatedButton(
                    onPressed: controller.update,
                    child: Text('Submit'),
                  ),
                  SizedBox(height: 8.0),

                  OutlinedButton(
                    onPressed: () => Get.back(),
                    child: Text('Cancel'),
                  ),
                ],
              )),
        ));
  }
}
