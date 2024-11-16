import 'package:flutter/material.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<Map<String, dynamic>> _messages = []; // Stores chat messages dynamically

  // Function to handle sending a message
  void _sendMessage(String text) {
    if (text.isNotEmpty) {
      setState(() {
        // Add user's message
        _messages.add({'text': text, 'isUser': true});

        // Simulate a chatbot response
        _messages.add({
          'text': 'You said: $text', // Replace this with your chatbot response logic
          'isUser': false
        });
      });
      _textController.clear(); // Clear the text field
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF14151C), // Background color
      body: SafeArea(
        child: Column(
          children: [
            // Header with chatbot name
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
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

            // Chat messages (dynamic)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  final isUser = message['isUser'] as bool;

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment:
                          isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isUser)
                          const CircleAvatar(
                            radius: 21,
                            backgroundColor: Color(0xFF3F3F3F),
                            backgroundImage: AssetImage('assets/images/authRobot.png'),
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
                                bottomLeft: isUser
                                    ? const Radius.circular(13)
                                    : Radius.zero,
                                bottomRight: isUser
                                    ? Radius.zero
                                    : const Radius.circular(13),
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
              ),
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
                        controller: _textController,
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
                        onSubmitted: _sendMessage, // Send message on enter
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
                      onPressed: () => _sendMessage(_textController.text),
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
