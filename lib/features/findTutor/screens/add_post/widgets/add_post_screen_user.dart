import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/utils/validators/validation.dart';

import '../../../controllers/upload_post_controller.dart';

class UserPostUploadScreen extends StatelessWidget {
  const UserPostUploadScreen({
    super.key,
    required this.controller,
  });

  final UploadPostController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Post to find a tutor',
            style: Theme.of(context).textTheme.headlineMedium),
        TextFormField(
          controller: controller.title,
          validator: (value) => TValidator.validateEmpty(value),
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'Title',
              hintText: 'Title'),
        ),

        SizedBox(height: 8.0),

        TextFormField(
          controller: controller.description,
          validator: (value) => TValidator.validateEmpty(value),
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'Description',
              hintText: 'Description'),
        ),

        SizedBox(height: 8.0),

        TextFormField(
          controller: controller.subject,
          validator: (value) => TValidator.validateEmpty(value),
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'Subject',
              hintText: 'Subject'),
        ),

        SizedBox(height: 8.0),

        TextFormField(
          controller: controller.grade,
          validator: (value) => TValidator.validateEmpty(value),
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'Grade',
              hintText: 'Grade'),
        ),

        SizedBox(height: 8.0),

        TextFormField(
          controller: controller.hourlyPrice,
          validator: (value) => TValidator.validateEmpty(value),
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
              labelText: 'Hourly Price',
              hintText: 'Hourly Price'),
        ),
        SizedBox(height: 8.0),

        TextFormField(
          controller: controller.location,
          validator: (value) => TValidator.validateEmpty(value),
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.email),
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
            prefixIcon: Icon(Icons.accessibility),
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

        Obx(
          () => InkWell(
            onTap: controller.pickImage,
            child: Stack(
              alignment: Alignment.center,
              children: [
                if (controller.image.isNotEmpty)
                  Image.file(
                    File(controller.image.value),
                    width: 120.0,
                    height: 120.0,
                    fit: BoxFit.cover,
                  )
                else
                  Icon(
                    Icons.camera_alt,
                    size: 60.0,
                    color: Colors.blue,
                  ),
              ],
            ),
          ),
        ),

        SizedBox(height: 8.0),
        // ... (other text fields)
        ElevatedButton(
          onPressed: controller.UploadUserPost,
          child: Text('Upload Student Post'),
        ),

        SizedBox(height: 8.0),

        OutlinedButton(
          onPressed: () => Get.back(),
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
