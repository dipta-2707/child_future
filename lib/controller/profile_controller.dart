import 'package:child_future/Api.dart';
import 'package:child_future/config/route_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  void onInit() {
    passwordController.text = "******";
    nameController.text =
        AppApi.firebaseAuth.currentUser!.displayName ?? 'Guest';
    emailController.text = AppApi.firebaseAuth.currentUser!.email ?? '';
    super.onInit();
  }

  void updateProfile() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) return;
    AppApi.firebaseAuth.currentUser!.updateEmail(emailController.text);
    AppApi.firebaseAuth.currentUser!.updateDisplayName(nameController.text);
    AppApi.firebaseAuth.currentUser!.updatePassword(passwordController.text);
  }

  void logout() {
    AppApi.firebaseAuth.signOut();
    Get.offAndToNamed(AppRouteConfig.signInRoute);
  }
}
