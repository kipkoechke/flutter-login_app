import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:login_app/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';

class BFadeInAnimation extends StatelessWidget {
  BFadeInAnimation({
    super.key,
    required this.durationIMls,
    required this.child,
    this.animate,
  });

  final controller = Get.put(FadeInAnimationController());
  final int durationIMls;
  final Widget child;
  final BAnimatedPosition? animate;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: durationIMls),
        top: controller.animate.value ? animate!.topAfter : animate!.topBefore,
        left:
            controller.animate.value ? animate!.leftAfter : animate!.leftBefore,
        bottom: controller.animate.value
            ? animate!.bottomAfter
            : animate!.bottomeBefore,
        right: controller.animate.value
            ? animate!.rightAfter
            : animate!.rightBefore,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 2400),
          opacity: controller.animate.value ? 1 : 0,
          child: child,
        ),
      ),
    );
  }
}
