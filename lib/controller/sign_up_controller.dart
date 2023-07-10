import 'package:child_future/config/route_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPageController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  void signUp(){

  }

  void gotoSignIn(){
    Get.toNamed(AppRouteConfig.signInRoute);
  }
}