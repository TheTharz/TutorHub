import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutorhub/features/authentication/controllers/signup/signup_controller.dart';
import 'package:tutorhub/utils/validators/validation.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: controller.name,
              validator: (value) => TValidator.validateEmpty(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Name',
                  hintText: 'Name'),
            ),

            const SizedBox(height: 16),

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

            Obx(() => TextFormField(
                  controller: controller.confirmpassword,
                  validator: (value) => TValidator.validatePassword(value),
                  obscureText: controller.hideConfirmPassword.value,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      labelText: 'Confirm Password',
                      hintText: 'Confirm Password',
                      suffixIcon: IconButton(
                          onPressed: () => controller.hideConfirmPassword
                              .value = !controller.hideConfirmPassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility))),
                )),

            const SizedBox(height: 16),

            // Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signUp(),
                child: const Text('Create Account'),
              ),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: 20,
                    height: 20,
                    child: Obx(
                      () => Checkbox(
                        value: controller.privacyPolicy.value,
                        onChanged: (value) {
                          controller.privacyPolicy.value =
                              !controller.privacyPolicy.value;
                        },
                      ),
                    )),
                Text(
                  'I agree to the Terms And Conditions',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            )
          ],
        ));
  }
}
