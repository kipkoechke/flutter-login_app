import 'package:flutter/material.dart';
import 'package:login_app/constants/image_strings.dart';
import 'package:login_app/constants/sizes.dart';
import 'package:login_app/constants/text_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animate = false;

  @override
  void initState() {
    startAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: animate ? 0 : -30,
            left: animate ? 0 : -30,
            child: const Image(
              image: AssetImage(bSplashTopIcon),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 1600),
            top: 80,
            left: animate ? bDefaultSize : -80,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1600),
              opacity: animate ? 1 : 0,
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
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2400),
            bottom: animate ? 100 : -30,
            left: animate ? 50 : 0,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2400),
              opacity: animate ? 1 : 0,
              child: const Image(
                image: AssetImage(bSplashImage),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2400),
            bottom: animate ? 40 : -100,
            right: bDefaultSize,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 2400),
              opacity: animate ? 1 : 0,
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
        ],
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    setState(() {
      animate = true;
    });
  }
}
