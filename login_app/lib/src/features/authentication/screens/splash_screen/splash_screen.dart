import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:login_app/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:login_app/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    return Scaffold(
      body: Stack(
        children: [
          BFadeInAnimation(
            durationIMls: 1600,
            animate: BAnimatedPosition(
              topAfter: 0,
              topBefore: -30,
              leftAfter: 0,
              leftBefore: -30,
            ),
            child: const Image(
              image: AssetImage(bSplashTopIcon),
            ),
          ),
          BFadeInAnimation(
            durationIMls: 2000,
            animate: BAnimatedPosition(
              topAfter: 80,
              topBefore: 80,
              leftAfter: bDefaultSize,
              leftBefore: -80,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bAppName,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  bAppTagLine,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          BFadeInAnimation(
            durationIMls: 2400,
            animate: BAnimatedPosition(
              bottomAfter: 100,
              bottomeBefore: -30,
              leftAfter: 50,
              leftBefore: 0,
            ),
            child: const Image(
              image: AssetImage(bSplashImage),
            ),
          ),
          BFadeInAnimation(
            durationIMls: 2400,
            animate: BAnimatedPosition(
              bottomAfter: 60,
              bottomeBefore: 00,
              rightBefore: bDefaultSize,
              rightAfter: bDefaultSize,
            ),
            child: Container(
              width: bSplashContainerSize,
              height: bSplashContainerSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.yellow,
              ),
            ),
          )
        ],
      ),
    );
  }
}
