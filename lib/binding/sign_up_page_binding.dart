
import 'package:child_future/controller/sign_up_controller.dart';
import 'package:get/get.dart';

class SignUpPageBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SignUpPageController>(() => SignUpPageController());
  }

}