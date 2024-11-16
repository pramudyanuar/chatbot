import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chatbot/core/utils/routes_screen.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();  // Check login status when the SplashScreen is initialized
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    print(isLoggedIn);

    // Navigate to the main screen if logged in, otherwise to the login screen
    if (isLoggedIn) {
      Get.offAllNamed(NavigationRoute.main);  // User is logged in
    } else {
      Get.offAllNamed(NavigationRoute.onboarding);  // User is not logged in
    }
  }
}
