import 'dart:convert';
import 'package:chatbot/core/global_components/base_widget_container.dart';
import 'package:chatbot/core/global_components/custom_button.dart';
import 'package:chatbot/core/global_components/custom_textfield.dart';
import 'package:chatbot/core/utils/routes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  Future<void> _saveLoginStatus(bool isLoggedIn) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      bool success = await prefs.setBool('isLoggedIn', isLoggedIn);
      print('Login status saved: $success');
    } catch (e) {
      print('Error saving login status: $e');
    }
  }

  Future<void> _login() async {
    final String url = 'http://10.0.2.2:5000/login';

    // Create request payload
    Map<String, String> loginData = {
      'username': emailController.text.trim(),
      'password': passwordController.text.trim(),
    };

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(loginData),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Successfully logged in
        print("Login successful: ${response.body}");
        Get.snackbar("Login", "Login Success");
        _saveLoginStatus(true);
        Get.offAllNamed(NavigationRoute.main);
      } else {
        // Handle error
        print("Failed to login: ${response.statusCode}");
        _showErrorDialog("Login failed. Please try again.");
      }
    } catch (e) {
      print("Error: $e");
      _showErrorDialog("An error occurred. Please try again later.");
    }
  }

  // Show error dialog
  void _showErrorDialog(String message) {
    Get.defaultDialog(
      title: "Error",
      middleText: message,
      textConfirm: "OK",
      onConfirm: () {
        Get.back();
      },
    );
  }

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
                  'Sign In',
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
                    width: 250.w,
                    height: 250.h,
                  ),
                ),
                const SizedBox(height: 20),
                // Email Input
                CustomTextInput(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  icon: Icons.email,
                  controller: emailController,
                  isPassword: false,
                ),
                const SizedBox(height: 20),
                // Password Input
                CustomTextInput(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  icon: Icons.lock,
                  controller: passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.offAllNamed(NavigationRoute.forgotpass);
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Sign In Button
                AuthButton(
                  text: "Login",
                  onPressed: _login, // Trigger the login API call
                ),
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
                        Get.offAllNamed(NavigationRoute.register);
                      },
                      child: const Text(
                        'Sign Up here',
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
