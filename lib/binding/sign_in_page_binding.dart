import 'package:child_future/controller/sign_in_controller.dart';
import 'package:get/get.dart';

class SignInPageBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignInPageController());
  }

}