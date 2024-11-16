import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextInput extends StatelessWidget {
  final String labelText;
  final String hintText;
  final IconData icon;
  final Color borderColor;
  final Color backgroundColor;
  final Color textColor;
  final Color hintColor;
  final TextEditingController controller;
  final bool isPassword;

  CustomTextInput({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.icon,
    required this.controller,
    this.borderColor = const Color(0xFF002DFF),
    this.backgroundColor = const Color(0xFFD9D9D9),
    this.textColor = Colors.black,
    this.hintColor = const Color(0xFF99969E),
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RxBool isObscured = true.obs; // Using RxBool for state management

    return Container(
      width: 337.w,
      height: 79.h,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 27,
            child: Container(
              width: 337,
              height: 52,
              decoration: ShapeDecoration(
                color: backgroundColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    color: borderColor,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Positioned(
            left: 18,
            top: 40,
            child: Icon(
              icon,
              size: 25,
              color: textColor,
            ),
          ),
          Positioned(
            left: 4,
            top: 0,
            child: Text(
              labelText,
              style: TextStyle(
                color: hintColor,
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            left: 67,
            top: 27,
            child: SizedBox(
              width: 250,
              child: isPassword
                  ? Obx(
                      () => TextField(
                        controller: controller,
                        obscureText: isObscured.value,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 14,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          hintText: hintText,
                          hintStyle: TextStyle(
                            color: hintColor,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 14),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isObscured.value ? Icons.visibility_off : Icons.visibility,
                              color: textColor,
                            ),
                            onPressed: () {
                              isObscured.value = !isObscured.value;
                            },
                          ),
                        ),
                      ),
                    )
                  : TextField(
                      controller: controller,
                      obscureText: false,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                        hintText: hintText,
                        hintStyle: TextStyle(
                          color: hintColor,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
