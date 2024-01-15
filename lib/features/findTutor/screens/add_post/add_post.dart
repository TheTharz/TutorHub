import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/features/findTutor/controllers/upload_post_controller.dart';

import '../../../../utils/validators/validation.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadPostController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                controller: controller.degree,
                validator: (value) => TValidator.validateEmpty(value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Degree',
                    hintText: 'Degree'),
              ),

              SizedBox(height: 8.0),

              TextFormField(
                controller: controller.experience,
                validator: (value) => TValidator.validateEmpty(value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Experience',
                    hintText: 'Experience'),
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
                        ),
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
        ),
      ),
    );
  }
}
