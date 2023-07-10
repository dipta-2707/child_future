import 'package:child_future/controller/home_page_controller.dart';
import 'package:get/get.dart';

class HomePageBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomePageController>(() => HomePageController());
  }

}