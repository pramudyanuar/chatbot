import 'package:chatbot/core/global_components/base_widget_container.dart';
import 'package:flutter/material.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF14151C), // Background color
        ),
        child: const Center( // Center the content
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "We're working with this feature",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center, // Center align text
                ),
                SizedBox(height: 16),
                Icon(
                  Icons.construction, // Optional icon to indicate work in progress
                  color: Colors.grey,
                  size: 64,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
