// ignore_for_file: use_key_in_widget_constructors

import 'package:chatbot/core/helpers/bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:get/get.dart';

class BottomNav extends StatelessWidget {
  final NavController navController = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => StylishBottomBar(
          backgroundColor: const Color(0xFF14151C), // Set background color here
          option: BubbleBarOptions(
            barStyle: BubbleBarStyle.horizontal,
            bubbleFillStyle: BubbleFillStyle.fill,
            opacity: 0.3,
            inkColor: Colors.white,
            unselectedIconColor: Colors.white,
          ),
          currentIndex: navController.selectedIndex.value,
          onTap: (index) => navController.changeTabIndex(index),
          items: [
            BottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              backgroundColor: Colors.white,
            ),
            BottomBarItem(
              icon: const Icon(Icons.article),
              title: const Text('Article'),
              backgroundColor: Colors.white,
            ),
            BottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text('Profile'),
              backgroundColor: Colors.white,
            ),
          ],
        ));
  }
}
