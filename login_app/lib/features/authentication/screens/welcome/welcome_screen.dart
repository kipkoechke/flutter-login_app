import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/common_widgets/fade_in_animation/animation_design.dart';
import 'package:login_app/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:login_app/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:login_app/constants/colors.dart';
import 'package:login_app/constants/image_strings.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';

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
        body: Stack(
          children: [
            BFadeInAnimation(
              durationIMls: 1200,
              animate: BAnimatedPosition(
                  topAfter: 0,
                  topBefore: 0,
                  leftAfter: 0,
                  leftBefore: 0,
                  bottomAfter: 0,
                  bottomeBefore: -100,
                  rightAfter: 0,
                  rightBefore: 0),
              child: Container(
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
                            onPressed: () {},
                            child: Text(bLogin.toUpperCase()),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(bSignup.toUpperCase()),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
