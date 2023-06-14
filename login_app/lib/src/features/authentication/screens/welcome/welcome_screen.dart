import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';
import 'package:login_app/src/features/authentication/screens/login/login_screen.dart';
import 'package:login_app/src/features/authentication/screens/signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    var mediaQuery = MediaQuery.of(context);
    // var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    var isDark = brightness == Brightness.dark;

    return Scaffold(
        backgroundColor: isDark ? bSecondaryColor : bPrimaryColor,
        body: Stack(children: [
          Container(
            padding: const EdgeInsets.all(bDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Image(
                  image: AssetImage(bWelcomeScreenImage),
                  // height: height * 0.6,
                ),
                Column(
                  children: [
                    Text(
                      bWelcomeTitle,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    Text(
                      bWelcomeSubtitle,
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Get.to(() => const LoginScreen());
                        },
                        child: Text(bLogin.toUpperCase()),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const SignUpScreen());
                        },
                        child: Text(bSignup.toUpperCase()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]));
  }
}
