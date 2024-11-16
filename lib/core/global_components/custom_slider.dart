import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlidingButtonController extends GetxController {
  var arrowPosition = 0.0.obs;
  final double maxPosition = 287.0; // Maximum position for the arrow

  void updatePosition(double delta) {
    arrowPosition.value = (arrowPosition.value + delta).clamp(0.0, maxPosition);
  }

  void snapPosition(VoidCallback triggerAction) {
    if (arrowPosition.value >= maxPosition) {
      arrowPosition.value = maxPosition;
      triggerAction(); // Trigger the action when the arrow reaches the end
    } else {
      arrowPosition.value = 0.0; // Snap back to the start if not fully slid
    }
  }
}

class SlidingButton extends StatelessWidget {
  final VoidCallback onTrigger; // Custom action passed as a parameter

  SlidingButton({required this.onTrigger});

  final SlidingButtonController controller = Get.put(SlidingButtonController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        controller.updatePosition(details.delta.dx);
      },
      onHorizontalDragEnd: (details) {
        controller.snapPosition(onTrigger);
      },
      child: Container(
        width: 337,
        height: 52,
        decoration: ShapeDecoration(
          color: const Color(0xFF003CFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Stack(
          children: [
            Obx(() {
              double opacity = (controller.arrowPosition.value / controller.maxPosition).clamp(0.0, 1.0);
              return Positioned(
                left: 21,
                top: 14,
                child: Opacity(
                  opacity: opacity,
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              );
            }),
            Obx(() => Positioned(
                  left: controller.arrowPosition.value,
                  top: 1,
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      'assets/icon/arrow-circle-right.png',
                      width: 30, // Adjust size as needed
                      height: 30,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
