import 'package:child_future/Api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPassController extends GetxController {
  TextEditingController emailController = TextEditingController();

  void sentLink() {
    if (emailController.text.isNotEmpty) {
      AppApi.firebaseAuth.sendPasswordResetEmail(email: emailController.text);
      emailController.clear();
      Get.snackbar(
        'Success',
        'Please check your mail inbox.',
      );
    } else {
      Get.snackbar('Error', 'Enter a valid email');
    }
  }
}
