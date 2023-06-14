import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/constants/colors.dart';
import 'package:login_app/constants/image_strings.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';
import 'package:login_app/features/authentication/screens/login/login_screen.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('OR'),
        const SizedBox(height: bDefaultSize - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Image(
              image: AssetImage(bGoogleLogoImage),
              width: 20.0,
            ),
            label: Text(bSignInWithGoogle.toUpperCase()),
          ),
        ),
        const SizedBox(height: bFormHeight - 20),
        TextButton(
          onPressed: () {
            Get.to(() => const LoginScreen());
          },
          child: Text.rich(
            TextSpan(
              text: bAlreadyHaveAnAccount.toUpperCase(),
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: bLogin.toUpperCase(),
                  style: const TextStyle(color: bPrimaryColor),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
