import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/authentication/controllers/signup_controller.dart';
import 'package:login_app/src/repository/authentication_repository/authentication_reposirtory.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: bFormHeight - 10),
        child: Column(
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_rounded),
                label: Text(bFullName),
              ),
            ),
            const SizedBox(height: bFormHeight - 20),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_rounded),
                label: Text(bEmail),
              ),
            ),
            const SizedBox(height: bFormHeight - 20),
            TextFormField(
              controller: controller.phoneNo,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                label: Text(bPhoneNo),
              ),
            ),
            const SizedBox(height: bFormHeight - 20),
            TextFormField(
              controller: controller.password,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.password_rounded),
                label: Text(bPassword),
                suffixIcon: Icon(Icons.remove_red_eye_rounded),
              ),
            ),
            const SizedBox(height: bFormHeight - 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    AuthenticationRepository.instance
                        .createUserWithEmailAndPassword(
                            controller.email.text.trim(),
                            controller.password.text.trim());
                    // SignUpController.instance.registerUser(
                    //     controller.email.text.trim(),
                    //     controller.password.text.trim());
                  }
                },
                child: Text(
                  bSignup.toUpperCase(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
