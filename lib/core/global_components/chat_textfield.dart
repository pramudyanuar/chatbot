import 'package:flutter/material.dart';

class ChatTextInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatTextInput({
    Key? key,
    required this.controller,
    required this.onSend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382,
      height: 50,
      child: Stack(
        children: [
          // Main Text Input Container
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 324,
              height: 50,
              decoration: ShapeDecoration(
                color: const Color(0xFF2B2B30),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1,
                    color: Color(0xFF3D3E3F),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  controller: controller,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Type Something ....................',
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          // Send Button Container
          Positioned(
            left: 332,
            top: 0,
            child: GestureDetector(
              onTap: onSend,
              child: Container(
                width: 50,
                height: 50,
                decoration: ShapeDecoration(
                  color: const Color(0xFF2B2B30),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 1,
                      color: Color(0xFF3D3E3F),
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
