import 'package:flutter/material.dart';

class ConfirmButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressed;

  const ConfirmButton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
    required this.iconColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 120,
        height: 48.29,
        decoration: ShapeDecoration(
          color: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 23,
              top: 12,
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              left: 67,
              top: 9,
              child: Icon(
                icon,
                color: iconColor,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Static method to create a "Yes" button
  static ConfirmButton yesButton(VoidCallback onPressed) {
    return ConfirmButton(
      text: 'Yes',
      backgroundColor: const Color(0xFF003CFF),
      textColor: Colors.white,
      icon: Icons.check_circle,
      iconColor: Colors.white,
      onPressed: onPressed,
    );
  }

  // Static method to create a "No" button
  static ConfirmButton noButton(VoidCallback onPressed) {
    return ConfirmButton(
      text: 'No',
      backgroundColor: Colors.red,
      textColor: Colors.white,
      icon: Icons.cancel,
      iconColor: Colors.white,
      onPressed: onPressed,
    );
  }
}
