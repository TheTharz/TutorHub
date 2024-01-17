import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/common/widgets/text/section_heading.dart';
import 'package:tutorhub/features/personalization/controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final user = controller.user.value;

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
                        radius: 70,
                      ),
                    SizedBox(width: 8),
                    TextButton(
                      onPressed: () {
                        // Implement logic to change profile picture
                      },
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 12),
              const SectionHeading(
                title: 'Edit Your Profile',
                showActionButton: false,
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: user.username,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  labelText: 'User Name',
                ),
                onChanged: (value) {
                  // Handle changes to user name
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: user.phoneNumber,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  labelText: 'Phone Number',
                ),
                onChanged: (value) {
                  // Handle changes to phone number
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: user.bio,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  labelText: 'Bio',
                ),
                onChanged: (value) {
                  // Handle changes to bio
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: user.address,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  labelText: 'Address',
                ),
                onChanged: (value) {
                  // Handle changes to address
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: user.socialLinkModel?.facebook,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  labelText: 'Facebook',
                ),
                onChanged: (value) {
                  // Handle changes to Facebook
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: user.socialLinkModel?.linkedin,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  labelText: 'LinkedIn',
                ),
                onChanged: (value) {
                  // Handle changes to LinkedIn
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: user.socialLinkModel?.twitter,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  labelText: 'Twitter',
                ),
                onChanged: (value) {
                  // Handle changes to LinkedIn
                },
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement logic to submit changes
                        // controller.updateUserProfile();
                      },
                      child: Text('Submit'),
                    ),
                  ),
                  SizedBox(width: 8.0), // Add some space between buttons
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      child: Text('Cancel'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
