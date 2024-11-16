import 'package:chatbot/core/global_components/base_widget_container.dart';
import 'package:chatbot/core/utils/routes_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseWidgetContainer(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Color(0xFF14151C), // Background color
        ),
        child: Center( // Center the content
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: (){
                    Get.offAllNamed(NavigationRoute.chatscreen);
                  },
                  child: const Text("Chat with us"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
