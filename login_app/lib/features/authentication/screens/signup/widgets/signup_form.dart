import 'package:flutter/material.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: bFormHeight - 10),
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_rounded),
                label: Text(bFullName),
              ),
            ),
            const SizedBox(height: bFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_rounded),
                label: Text(bEmail),
              ),
            ),
            const SizedBox(height: bFormHeight - 20),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone),
                label: Text(bPhoneNo),
              ),
            ),
            const SizedBox(height: bFormHeight - 20),
            TextFormField(
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
                onPressed: () {},
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
