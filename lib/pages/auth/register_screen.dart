import 'package:chatbot/core/global_components/base_widget_container.dart';
import 'package:chatbot/core/global_components/custom_button.dart';
import 'package:chatbot/core/global_components/custom_textfield.dart';
import 'package:chatbot/core/utils/routes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  RegisterScreen({super.key});

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
                  'Sign Up',
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
                    'assets/images/authRobot.png',
                    width: 150.w,
                    height: 150.h,
                  ),
                ),
                const SizedBox(height: 10),
                // Email Input dengan Lebar yang Dikurangi
                CustomTextInput(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      icon: Icons.email,
                      controller: emailController,
                      isPassword: false,
                    ),
                const SizedBox(height: 10),
                CustomTextInput(
                      labelText: 'Username',
                      hintText: 'Enter your username',
                      icon: Icons.person,
                      controller: usernameController,
                      isPassword: false,
                    ),
                const SizedBox(height: 10),
                CustomTextInput(
                      labelText: 'Password',
                      hintText: 'Enter your email',
                      icon: Icons.lock,
                      controller: emailController,
                      isPassword: true,
                    ),
                const SizedBox(height: 10),
                // Password Input dengan Lebar yang Dikurangi
                CustomTextInput(
                      labelText: 'Confirm Your Password',
                      hintText: 'Reenter your password',
                      icon: Icons.lock,
                      controller: passwordController,
                      isPassword: true,
                    ),
                const SizedBox(height: 30),
                // Sign In Button
                AuthButton(text: "Register", onPressed: (){
                  // Handle login action
                }),
                const SizedBox(height: 10),
                // Sign Up Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Doesn’t have any accounts?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: () {
                        Get.offNamed(NavigationRoute.login);
                      },
                      child: const Text(
                        'Sign In here',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
