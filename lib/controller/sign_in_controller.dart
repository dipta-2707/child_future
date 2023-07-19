import 'package:child_future/Api.dart';
import 'package:child_future/config/route_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPageController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signIn() {
    try {
      AppApi.firebaseAuth
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        clearController();
        Get.offAndToNamed(AppRouteConfig.homeRoute);
      });
    }catch(e){}
    clearController();

    //Get.offAndToNamed(AppRouteConfig.homeRoute);
  }

  void gotoForgetPassword() {
    Get.toNamed(AppRouteConfig.forgetPassword);
  }

  void gotoSignUp() {
    Get.toNamed(AppRouteConfig.signUpRoute);
  }

  void clearController() {
    emailController.clear();
    passwordController.clear();
  }
}
