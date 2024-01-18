import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/utils/validators/validation.dart';

import '../../../controllers/upload_post_controller.dart';

class TutorPostAddScreen extends StatelessWidget {
  const TutorPostAddScreen({
    super.key,
    required this.controller,
  });

  final UploadPostController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text('Post a Tutoring Service',
                style: Theme.of(context).textTheme.headlineMedium),
          ),

          const SizedBox(height: 16),

          Obx(
            () => InkWell(
              onTap: controller.pickImage,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (controller.image.isNotEmpty)
                    Image.file(
                      File(controller.image.value),
                      width: 300,
                      height: 200,
                      fit: BoxFit.cover,
                    )
                  else
                    Icon(
                      Icons.camera_alt,
                      size: 200,
                      color: Colors.blue,
                    ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          TextFormField(
            controller: controller.title,
            validator: (value) => TValidator.validateEmpty(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.title),
                labelText: 'Title',
                hintText: 'Title'),
          ),

          SizedBox(height: 8.0),

          TextFormField(
            controller: controller.description,
            validator: (value) => TValidator.validateEmpty(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.description),
                labelText: 'Description',
                hintText: 'Description'),
          ),

          SizedBox(height: 8.0),

          TextFormField(
            controller: controller.subject,
            validator: (value) => TValidator.validateEmpty(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.subject),
                labelText: 'Subject',
                hintText: 'Subject'),
          ),

          SizedBox(height: 8.0),

          TextFormField(
            controller: controller.grade,
            validator: (value) => TValidator.validateEmpty(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.grade),
                labelText: 'Grade',
                hintText: 'Grade'),
          ),

          SizedBox(height: 8.0),

          TextFormField(
            controller: controller.hourlyPrice,
            validator: (value) => TValidator.validateEmpty(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.price_change_rounded),
                labelText: 'Hourly Price',
                hintText: 'Hourly Price'),
          ),
          SizedBox(height: 8.0),

          TextFormField(
            controller: controller.degree,
            validator: (value) => TValidator.validateEmpty(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.cast_for_education),
                labelText: 'Degree',
                hintText: 'Degree'),
          ),

          SizedBox(height: 8.0),

          TextFormField(
            controller: controller.experience,
            validator: (value) => TValidator.validateEmpty(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.explore_rounded),
                labelText: 'Experience',
                hintText: 'Experience'),
          ),

          SizedBox(height: 8.0),

          TextFormField(
            controller: controller.location,
            validator: (value) => TValidator.validateEmpty(value),
            decoration: const InputDecoration(
                prefixIcon: Icon(Icons.location_on),
                labelText: 'Location',
                hintText: 'Location'),
          ),

          SizedBox(height: 8.0),

          DropdownButtonFormField<String>(
            value: controller.preferredMethod.value,
            items: ['Online', 'Physical', 'Both']
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ),
                )
                .toList(),
            onChanged: (value) => controller.preferredMethod.value = value!,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.online_prediction),
              labelText: 'Preferred Method',
              hintText: 'Preferred Method',
            ),
          ),

          SizedBox(height: 8.0),

          DropdownButtonFormField<String>(
            value: controller.preferredDate.value,
            items: ['Weekday', 'Weekend']
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  ),
                )
                .toList(),
            onChanged: (value) => controller.preferredDate.value = value!,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.calendar_today),
              labelText: 'Preferred Date',
              hintText: 'Preferred Date',
            ),
          ),

          SizedBox(height: 8.0),

          SizedBox(height: 8.0),
          // ... (other text fields)
          ElevatedButton(
            onPressed: controller.uploadPost,
            child: Text('Upload Post'),
          ),

          SizedBox(height: 8.0),

          OutlinedButton(
            onPressed: () => Get.back(),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
