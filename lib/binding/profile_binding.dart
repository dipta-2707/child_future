import 'package:child_future/controller/profile_controller.dart';
import 'package:get/get.dart';

class ProfilePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}
