import 'package:child_future/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashPageController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/child.jpg',
            fit: BoxFit.cover,
            height: Get.height,
            width: Get.width,
          ),
          Positioned(
              bottom: Get.height * 0.1,
              left: Get.width * 0.3,
              child: TextButton(
                  onPressed: () {
                    controller.gotoNext();
                  },
                  child: const Text('Press to continue >>>')))
        ],
      ),
    );
  }
}
