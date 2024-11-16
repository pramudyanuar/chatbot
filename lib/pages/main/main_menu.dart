import 'package:chatbot/core/global_components/base_bottom_nav.dart';
import 'package:chatbot/core/global_components/base_widget_container.dart';
import 'package:chatbot/core/helpers/bottom_nav_controller.dart';
import 'package:chatbot/pages/explore/explore_screen.dart';
import 'package:chatbot/pages/news/news_view.dart';
import 'package:chatbot/pages/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.put(NavController());
    final int initialIndex = Get.arguments?['index'] ?? 0;

    navController.changeTabIndex(initialIndex);

    return BaseWidgetContainer(
      body: SafeArea(
        child: Obx(
          () {
            switch (navController.selectedIndex.value) {
              case 0:
                return  ExploreView();
              case 1:
                return  ArticleView();
              case 2:
                return  ProfileView();
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNav(),
    );
  }
}
