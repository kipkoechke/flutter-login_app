import 'package:flutter/material.dart';
import 'package:login_app/constants/image_strings.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
            top: 0,
            left: 0,
            child: Image(
              image: AssetImage(bSplashTopIcon),
            ),
          ),
          Positioned(
            top: 80,
            left: bDefaultSize,
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
          const Positioned(
            bottom: 100,
            child: Image(
              image: AssetImage(bSplashImage),
            ),
          ),
          Positioned(
            bottom: 40,
            right: bDefaultSize,
            child: Container(
              width: bSplashContainerSize,
              height: bSplashContainerSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
