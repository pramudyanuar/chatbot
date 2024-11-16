import 'package:chatbot/pages/main/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:chatbot/core/global_components/base_widget_container.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return BaseWidgetContainer(
      body: Stack(
        children: <Widget>[
          Center(
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.8, end: 1),
              duration: const Duration(seconds: 1),
              curve: Curves.easeOut,
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.scale(
                    scale: value,
                    child: Image.asset(
                      'assets/icon/logo.png',
                      width: 200.w,
                      height: 200.h,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}