import 'package:child_future/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, Akash Das'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: CircleAvatar(

            ),
          )
        ],
      ),

      body: Obx(

          ()=> controller.indexPages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        ()=> BottomNavigationBar(
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
              icon: Icon(Icons.scale),
              label: 'Victim',
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
