import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/common/widgets/text/section_heading.dart';
import 'package:tutorhub/features/personalization/controllers/user_controller.dart';
import 'package:tutorhub/utils/validators/validation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    controller.initWithCurrentUser();

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
                    Obx(
                      () => InkWell(
                        onTap: controller.pickImage,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            if (controller.image.contains('http'))
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(controller.image.value),
                                radius: 60,
                              )
                            else
                              Image.file(
                                File(controller.image.value),
                                width: 120.0,
                                height: 120.0,
                                fit: BoxFit.cover,
                              )
                          ],
                        ),
                      ),
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
                // initialValue: user.username,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  labelText: 'User Name',
                ),
                controller: controller.username,
                validator: TValidator.validateEmpty,
              ),
              const SizedBox(height: 16),
              TextFormField(
                // initialValue: user.phoneNumber,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  labelText: 'Phone Number',
                ),
                controller: controller.phoneNumber,
              ),
              const SizedBox(height: 16),
              TextFormField(
                // initialValue: user.bio,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  labelText: 'Bio',
                ),
                controller: controller.bio,
                validator: TValidator.validateEmpty,
              ),
              const SizedBox(height: 16),
              TextFormField(
                // initialValue: user.address,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  labelText: 'Address',
                ),
                controller: controller.address,
              ),
              const SizedBox(height: 16),
              TextFormField(
                // initialValue: user.city,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  labelText: 'Location',
                ),
                controller: controller.city,
                validator: TValidator.validateEmpty,
              ),
              const SizedBox(height: 16),
              TextFormField(
                // initialValue: user.socialLinkModel?.facebook,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  labelText: 'Facebook',
                ),
                controller: controller.facebook,
              ),
              const SizedBox(height: 16),
              TextFormField(
                // initialValue: user.socialLinkModel?.linkedin,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  labelText: 'LinkedIn',
                ),
                controller: controller.linkedin,
              ),
              const SizedBox(height: 16),
              TextFormField(
                // initialValue: user.socialLinkModel?.twitter,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.edit),
                  labelText: 'Twitter',
                ),
                controller: controller.twitter,
              ),
              SizedBox(height: 8.0),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Implement logic to submit changes
                        controller.updateUser();
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
