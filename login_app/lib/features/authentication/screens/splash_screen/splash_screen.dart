import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/constants/image_strings.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';
import 'package:login_app/features/authentication/controllers/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  final splashController = Get.put(SplashScreenController());

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();

    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: splashController.animate.value ? 0 : -30,
              left: splashController.animate.value ? 0 : -30,
              child: const Image(
                image: AssetImage(bSplashTopIcon),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: 80,
              left: splashController.animate.value ? bDefaultSize : -80,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1600),
                opacity: splashController.animate.value ? 1 : 0,
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
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: splashController.animate.value ? 100 : -30,
              left: splashController.animate.value ? 50 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2400),
                opacity: splashController.animate.value ? 1 : 0,
                child: const Image(
                  image: AssetImage(bSplashImage),
                ),
              ),
            ),
          ),
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 2400),
              bottom: splashController.animate.value ? 40 : -100,
              right: bDefaultSize,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 2400),
                opacity: splashController.animate.value ? 1 : 0,
                child: Container(
                  width: bSplashContainerSize,
                  height: bSplashContainerSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.yellow,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
