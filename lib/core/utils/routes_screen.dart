import 'package:chatbot/pages/auth/forgotpass_screen.dart';
import 'package:chatbot/pages/auth/login_screen.dart';
import 'package:chatbot/pages/auth/register_screen.dart';
import 'package:chatbot/pages/chat/chat_screen.dart';
import 'package:chatbot/pages/explore/explore_screen.dart';
import 'package:chatbot/pages/main/main_menu.dart';
import 'package:chatbot/pages/main/onboarding_screen.dart';
import 'package:chatbot/pages/main/splash_screen.dart';
import 'package:chatbot/pages/news/news_view.dart';
import 'package:chatbot/pages/profile/profile_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class NavigationRoute {
  static String initial = '/';
  static String onboarding = '/onboarding';
  static String login = '/login';
  static String register = '/register';
  static String forgotpass = '/forgotpass';
  static String main = '/main';
  static String profile = '/profile';
  static String explore = '/explore';
  static String article = '/article';
  static String chatscreen = '/chatscreen';

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const SplashScreen()),
    GetPage(name: onboarding, page: () => const OnboardingScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: register, page: () => RegisterScreen()),
    GetPage(name: forgotpass, page: () => ForgotpassScreen()),
    GetPage(name: main, page: () => MainMenuScreen()),
    GetPage(name: profile, page: () => ProfileView()),
    GetPage(name: explore, page: () => ExploreView()),
    GetPage(name: article, page: () => ArticleView()),
    GetPage(name: chatscreen, page: () => ChatBotScreen()),
  ];
}