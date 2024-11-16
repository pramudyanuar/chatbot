import 'package:chatbot/core/global_components/base_widget_container.dart';
import 'package:chatbot/core/global_components/custom_slider.dart';
import 'package:chatbot/core/utils/routes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {    
    return BaseWidgetContainer(
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Jarak dari atas layar
            SizedBox(height: 65.h),
            // Top Decorative Shape
            Container(
              width: 82.w,
              height: 33.h,
              decoration: ShapeDecoration(
                color: const Color(0xFF5583FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            // Jarak antara elemen
            SizedBox(height: 30.h),
            // Main Heading
            const Text(
              'Explore your feelings and get tailored advice for your best day yet!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
            // Jarak antara elemen
            SizedBox(height: 30.h),
            // Subheading
            const Text(
              'Our friendly chatbot is here to understand you and guide you toward a better experience.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
            // Jarak antara elemen
            SizedBox(height: 30.h),
            // Gambar chatbot
            Center(
              child: Image.asset(
                'assets/images/robotOnboarding.png',
                width: 300.w,
                height: 300.h,
              ),
            ),
            // Spacer untuk mendorong elemen ke bawah
            const Spacer(),
            // Sliding Button di bagian bawah
            SlidingButton(onTrigger: () => Get.offAllNamed(NavigationRoute.login)),
          ],
        ),
      ),
    );
  }
}
