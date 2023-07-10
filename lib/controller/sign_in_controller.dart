import 'package:child_future/config/route_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInPageController extends GetxController{
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();


    void signIn(){
        Get.offAndToNamed(AppRouteConfig.homeRoute);
    }

    void gotoForgetPassword(){

    }

    void gotoSignUp(){
        Get.toNamed(AppRouteConfig.signUpRoute);
    }
}