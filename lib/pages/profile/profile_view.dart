import 'package:chatbot/core/global_components/base_widget_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF14151C), // Background color
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Title
              const Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 20),

              // Profile Picture
              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),

              // Username
              const Text(
                'John Doe', // Replace with dynamic username if needed
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),

              // Email
              const Text(
                'johndoe@example.com', // Replace with dynamic email if needed
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 32),

              // Spacer to push logout button to the bottom
              const Spacer(),

              // Logout Button
              SizedBox(
                width: double.infinity, // Full width
                child: ElevatedButton(
                  onPressed: () {
                    // Handle logout action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(200.w, 50.h),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
