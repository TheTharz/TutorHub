import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/features/authentication/controllers/login/login_controller.dart';

import '../../../../../utils/validators/validation.dart';

class LogInForm extends StatelessWidget {
  const LogInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogInController());

    return Form(
        key: controller.loginFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                  hintText: 'Email'),
            ),

            const SizedBox(height: 16),

            Obx(() => TextFormField(
                  controller: controller.password,
                  validator: (value) => TValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      labelText: 'Password',
                      hintText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility))),
                )),

            const SizedBox(height: 16),

            // Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.logIn(),
                child: const Text('Log In'),
              ),
            ),

            const SizedBox(height: 16),
          ],
        ));
  }
}
