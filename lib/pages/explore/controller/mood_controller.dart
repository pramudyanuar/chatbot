import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MoodController extends GetxController {
  var selectedMood = ''.obs;
  var journalEntries = <String>[].obs;
  var sentimentResult = ''.obs;

  Future<void> postJournal(String username, String content) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:5000/journal'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "username": username,
          "content": content,
        }),
      );

      if (response.statusCode == 201) {
        Get.snackbar("Success", "Journal posted successfully");
      } else {
        Get.snackbar("Error", "Failed to post journal");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    }
  }

  Future<void> fetchJournal(String username) async {
    try {
      final response = await http.get(
        Uri.parse('http://10.0.2.2:5000/journal/$username'),
      );

      if (response.statusCode == 200) {
        journalEntries.value = List<String>.from(json.decode(response.body));
      } else {
        Get.snackbar("Error", "Failed to fetch journals");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    }
  }

  Future<void> analyzeSentiment(String text) async {
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:5000/sentiment'),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"text": text}),
      );

      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        sentimentResult.value =
            "Label: ${result[0]['label']}, Score: ${result[0]['score']}";
      } else {
        Get.snackbar("Error", "Failed to analyze sentiment");
      }
    } catch (e) {
      Get.snackbar("Error", "An error occurred: $e");
    }
  }
}
