import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/authentication/screens/signup/signup_screen.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
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
            Get.to(() => const SignUpScreen());
          },
          child: Text.rich(
            TextSpan(
              text: bDontHaveAnAccount.toUpperCase(),
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                  text: bSignup.toUpperCase(),
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
