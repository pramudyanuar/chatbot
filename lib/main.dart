import 'package:flutter/material.dart';
import 'package:chatbot/core/config/my_app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  WidgetsFlutterBinding.ensureInitialized();  // Ensure initialization
  SharedPreferences.setMockInitialValues({});
  await dotenv.load(fileName: ".env");
  runApp(const MainApp() );
}