import 'package:child_future/Api.dart';
import 'package:child_future/config/route_config.dart';
import 'package:get/get.dart';

class SplashPageController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void gotoNext() {
    if (AppApi.firebaseAuth.currentUser != null) {
      Get.offAndToNamed(AppRouteConfig.homeRoute);
    } else {
      Get.offAndToNamed(AppRouteConfig.signInRoute);
    }
  }
}
