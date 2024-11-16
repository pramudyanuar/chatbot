import 'dart:convert';
import 'package:chatbot/core/global_components/base_widget_container.dart';
import 'package:chatbot/core/global_components/custom_button.dart';
import 'package:chatbot/core/global_components/custom_textfield.dart';
import 'package:chatbot/core/utils/routes_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  RegisterScreen({super.key});

  // Registration API Call
  Future<void> _register() async {
  final String url = 'http://10.0.2.2:5000/register';  // Your API URL

  // Create request payload
  Map<String, String> registerData = {
    'username': emailController.text.trim(),
    'password': passwordController.text.trim(),
  };

  // Check if the passwords match
  if (passwordController.text.trim() != confirmpasswordController.text.trim()) {
    _showErrorDialog('Passwords do not match.');
    return;
  }

  try {
    final response = await http.post(
      Uri.parse(url),
      body: json.encode(registerData),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    // Check the response status code
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Successfully registered (201 is also success for creation)
      print("Registration successful: ${response.body}");
      Get.offAllNamed(NavigationRoute.login); // Navigate to login screen
    } else {
      // Handle error, e.g., 400, 500, etc.
      print("Failed to register: ${response.statusCode}");
      _showErrorDialog("Registration failed. Please try again.");
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
                // Email Input
                CustomTextInput(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  icon: Icons.email,
                  controller: emailController,
                  isPassword: false,
                ),
                const SizedBox(height: 10),
                // Password Input
                CustomTextInput(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  icon: Icons.lock,
                  controller: passwordController,
                  isPassword: true,
                ),
                const SizedBox(height: 10),
                // Confirm Password Input
                CustomTextInput(
                  labelText: 'Confirm Your Password',
                  hintText: 'Re-enter your password',
                  icon: Icons.lock,
                  controller: confirmpasswordController,
                  isPassword: true,
                ),
                const SizedBox(height: 30),
                // Register Button
                AuthButton(
                  text: "Register",
                  onPressed: _register, // Trigger the register API call
                ),
                const SizedBox(height: 10),
                // Sign Up Link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
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
