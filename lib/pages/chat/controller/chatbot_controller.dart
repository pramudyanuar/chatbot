import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ChatBotController extends GetxController {
  var sessionId = ''.obs; // Observable session ID
  var messages = <Map<String, dynamic>>[].obs; // Observable list of messages
  TextEditingController textController = TextEditingController(); // Text editing controller for input

  // Function to create a session with the chatbot
  Future<void> createSession() async {
    final String url = 'http://10.0.2.2:5000/chatbot/create_session';
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final sessionData = json.decode(response.body);
        sessionId.value = sessionData['session_id']; // Update session ID
        print("Session created: ${sessionId.value}");
      } else {
        _showErrorDialog("Failed to create session.  Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
      _showErrorDialog("An error occurred while creating the session.");
    }
  }

  // Function to send a message to the chatbot
  Future<void> sendMessage(String text) async {
    if (text.isNotEmpty && sessionId.value.isNotEmpty) {
      // Add user's message
      messages.add({'text': text, 'isUser': true});

      final String url = 'http://10.0.2.2:5000/chatbot/chat/${sessionId.value}';
      Map<String, String> messageData = {'message': text};

      try {
        final response = await http.post(
          Uri.parse(url),
          body: json.encode(messageData),
          headers: {'Content-Type': 'application/json'},
        );

        if (response.statusCode == 200) {
          final responseData = json.decode(response.body);
          final botResponse = responseData['response'];

          // Add chatbot's response
          messages.add({'text': botResponse, 'isUser': false});
        } else {
          _showErrorDialog("Failed to get response from the bot.");
        }
      } catch (e) {
        print("Error: $e");
        _showErrorDialog("An error occurred while sending the message.");
      }
      textController.clear();
    }
  }

  // Function to show error dialog
  void _showErrorDialog(String message) {
    Get.defaultDialog(
      title: "Error",
      middleText: message,
      textConfirm: "OK",
      onConfirm: () {
        Get.back();
      },
    );
  }

    void endSession() {
    // Logic to handle session end
    messages.clear(); // Clear messages
    print('Session $sessionId ended'); // Log the session end
  }
}
