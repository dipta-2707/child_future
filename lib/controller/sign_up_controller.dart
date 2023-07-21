import 'package:child_future/Api.dart';
import 'package:child_future/config/route_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPageController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  void signUp() async{
    try {
     await AppApi.firebaseAuth
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then((value) {
        AppApi.firebaseAuth.currentUser
            ?.updateDisplayName(userNameController.text);
        Get.snackbar('Success', 'Account created Successfully');
        clearController();
      });
    }on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message.toString(), backgroundColor: Colors.red, );
    }
    clearController();
  }

  void gotoSignIn() {
    Get.toNamed(AppRouteConfig.signInRoute);
  }

  void clearController() {
    emailController.clear();
    passwordController.clear();
  }
}
