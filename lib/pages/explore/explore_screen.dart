import 'package:chatbot/core/global_components/base_widget_container.dart';
import 'package:chatbot/core/utils/routes_screen.dart';
import 'package:chatbot/pages/chat/controller/chatbot_controller.dart';
import 'package:chatbot/pages/explore/controller/mood_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreView extends StatelessWidget {
  ExploreView({super.key});
  final ChatBotController controller = Get.put(ChatBotController());
  final MoodController moodController = Get.put(MoodController()); // Tambahkan MoodController

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
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header & Avatar Section
                const Row(
                  children: [
                    // Avatar
                    CircleAvatar(
                      radius: 30,
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 20),
                    // Welcome Text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, Eldine",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "What’s your feeling today?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Mood Section
                Obx(() {
                  if (moodController.selectedMood.value.isNotEmpty) {
                    // Layout dalam bentuk Row
                    return Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C1E2B), // Background container
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Today's Emotion",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              // Emoji
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF50BFE6), // Warna latar emoji
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    moodController.selectedMood.value.split('|')[1], // Emoji
                                    style: const TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                          
                              // Mood Description
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      moodController.selectedMood.value.split('|')[0], // Mood Text
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }

                  // Jika belum ada mood yang dipilih
                  return const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _MoodButton(mood: "Sangat\nBuruk", emoji: "🥲"),
                      _MoodButton(mood: "Buruk", emoji: "😔"),
                      _MoodButton(mood: "Netral", emoji: "😐"),
                      _MoodButton(mood: "Baik", emoji: "😊"),
                      _MoodButton(mood: "Sangat\nBaik", emoji: "😄"),
                    ],
                  );
}),
                const SizedBox(height: 16),

                // Input Section
                const Text(
                  "Tell us what’s your feeling today!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9D9D9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Write your note here...",
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Buttons Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await controller.createSession();
                        if (controller.sessionId.isNotEmpty) {
                          Get.offAllNamed(
                            NavigationRoute.chatscreen,
                            parameters: {'session_id': controller.sessionId.value},
                          );
                        } else {
                          Get.snackbar("Error", "Failed to create session");
                        }
                      },
                      child: const _ActionButton(
                        title: "Chat with HarmonyAI",
                        icon: Icons.chat_bubble,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Aksi saat tombol ditekan
                      },
                      child: const _ActionButton(
                        title: "Check Your Daily Notes",
                        icon: Icons.note_add,
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

// Widget untuk Mood Button
class _MoodButton extends StatelessWidget {
  final String mood;
  final String emoji;

  const _MoodButton({required this.mood, required this.emoji});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<MoodController>().selectedMood.value = "$mood|$emoji";
      },
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFE5E5E6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            mood,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

// Widget untuk tombol aksi
class _ActionButton extends StatelessWidget {
  final String title;
  final IconData icon;

  const _ActionButton({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1E2B),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
