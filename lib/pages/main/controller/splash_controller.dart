import 'package:chatbot/core/utils/routes_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _decideNextScreen();
  }

  Future<void> _decideNextScreen() async {
    // Delay before deciding the next screen
    await Future.delayed(const Duration(seconds: 2));

    Get.offNamed(NavigationRoute.onboarding);

    // Check if user is logged in and navigate accordingly
    //bool isTokenAvailable = await SharedPreferencesUtils().isLogin();
    // if (isTokenAvailable) {
    //   Get.offNamed(NavigationRoute.mainMenu);
    // } else {
    //   Get.offNamed(NavigationRoute.login);
    // }
  }
}