import 'package:chatbot/core/global_components/base_widget_container.dart';
import 'package:chatbot/core/global_components/custom_button.dart';
import 'package:chatbot/core/global_components/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotpassScreen extends StatelessWidget {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();

  ForgotpassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF14151C),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                const Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    'assets/images/forgotRobot.png',
                    width: 250.w,
                    height: 250.h,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextInput(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      icon: Icons.lock,
                      controller: passwordController,
                      isPassword: true,
                    ),
                const SizedBox(height: 20),
                CustomTextInput(
                      labelText: 'Confirm Your Password',
                      hintText: 'Reenter your password',
                      icon: Icons.lock,
                      controller: newpasswordController,
                      isPassword: true,
                    ),
                const SizedBox(height: 40),
                // Sign In Button
                AuthButton(text: "Confirm", onPressed: (){
                  // Handle login action
                }),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
