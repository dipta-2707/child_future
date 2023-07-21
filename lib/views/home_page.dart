import 'package:child_future/Api.dart';
import 'package:child_future/config/route_config.dart';
import 'package:child_future/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Text(
            'Welcome, ${AppApi.firebaseAuth.currentUser?.displayName ?? 'Guest'}'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
                onPressed: () {
                  Get.toNamed(AppRouteConfig.profiledRoute);
                },
                icon: const Icon(Icons.person)),
          )
        ],
      ),
      body: Obx(() => controller.indexPages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Organization',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.accessibility),
              label: 'Victim',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'Scan Victim',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          onTap: (value) {
            controller.onPageTap(value);
          },
        ),
      ),
    );
  }
}
