import 'package:chatbot/core/global_components/base_widget_container.dart';
import 'package:flutter/material.dart';

class ArticleView extends StatelessWidget {
  ArticleView({super.key});

  // Dummy mental health news data
  final List<Map<String, String>> news = [
    {
      'title': 'Understanding Anxiety: A Modern Challenge',
      'description': 'Anxiety is one of the most common mental health challenges. Here’s how we can manage it...',
    },
    {
      'title': 'The Importance of Mental Health Awareness',
      'description': 'Mental health awareness is crucial to eliminating the stigma around mental illnesses...',
    },
    {
      'title': 'How to Deal with Stress in a Busy World',
      'description': 'Stress management is essential in today’s fast-paced world. Learn techniques to cope effectively...',
    },
    {
      'title': 'Mental Health and Relationships: Finding Balance',
      'description': 'Healthy relationships can play a big role in maintaining good mental health. Here’s how...',
    },
    {
      'title': 'The Impact of Social Media on Mental Health',
      'description': 'Social media can affect your mental well-being. Here’s what you need to know...',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF14151C), // Background color
        ),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Text(
                  "Article",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center, // Center align text
                ),
              ),
            ),
            // Displaying each mental health news item
            ...news.map((article) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2B2B30),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article['title'] ?? '',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        article['description'] ?? '',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
