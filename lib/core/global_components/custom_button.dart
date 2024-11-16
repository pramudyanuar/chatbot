import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const AuthButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 337,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF003CFF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Rounded corners
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Inter',
                color: Colors.white,
                fontWeight: FontWeight.w700,
                height: 0.06,
              ),
            ),
            const SizedBox(width: 8), // Space between text and icon
            Image.asset(
              'assets/icon/arrow-circle-right.png',
              width: 30, // Adjust size as needed
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
