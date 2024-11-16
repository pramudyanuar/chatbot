import 'package:chatbot/core/utils/routes_screen.dart';
import 'package:chatbot/pages/chat/controller/chatbot_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the session ID from the parameters
    final String sessionId = Get.parameters['session_id'] ?? '';

    // Initialize the controller and pass the session ID
    final ChatBotController controller = Get.put(ChatBotController());

    // Ensure the session ID is set for the controller
    controller.sessionId.value = sessionId;

    return Scaffold(
      backgroundColor: const Color(0xFF14151C),
      body: SafeArea(
        child: Column(
          children: [
Padding(
  padding: const EdgeInsets.symmetric(vertical: 16.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      // Centered text
      Expanded(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE5E5E6), width: 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              'MindWell ChatBot',
              style: TextStyle(
                color: Color(0xFFE5E5E6),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
      // End Session Icon
      IconButton(
        icon: const Icon(Icons.exit_to_app, color: Color(0xFFE5E5E6)),
        onPressed: () {
          // Handle the end session logic here
          controller.endSession();
          Get.offAllNamed('/main'); // Navigate back after ending session
        },
      ),
    ],
  ),
),

            // Chat messages (dynamic)
            Expanded(
              child: Obx(() {
                // Use Obx to reactively build the list of messages
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = controller.messages[index];
                    final isUser = message['isUser'] as bool;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: isUser
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!isUser)
                            const CircleAvatar(
                              radius: 21,
                              backgroundColor: Color(0xFF3F3F3F),
                              backgroundImage:
                                  AssetImage('assets/images/authRobot.png'),
                            ),
                          if (!isUser) const SizedBox(width: 8),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: isUser
                                    ? Colors.white
                                    : const Color(0xFF333337),
                                borderRadius: BorderRadius.only(
                                  topLeft: const Radius.circular(13),
                                  topRight: const Radius.circular(13),
                                  bottomLeft:
                                      isUser ? const Radius.circular(13) : Radius.zero,
                                  bottomRight: isUser ? Radius.zero : const Radius.circular(13),
                                ),
                              ),
                              child: Text(
                                message['text'],
                                style: TextStyle(
                                  color: isUser
                                      ? const Color(0xFF333337)
                                      : const Color(0xFFE5E5E6),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }),
            ),

            // Input field
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2B2B30),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFF3D3E3F),
                          width: 1,
                        ),
                      ),
                      child: TextField(
                        controller: controller.textController,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          hintText: 'Type Something ....................',
                          hintStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                        ),
                        onSubmitted: (text) {
                          controller.sendMessage(text); // Send message on enter
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2B2B30),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFF3D3E3F),
                        width: 1,
                      ),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () =>
                          controller.sendMessage(controller.textController.text),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
