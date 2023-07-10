import 'package:child_future/Api.dart';
import 'package:child_future/config/route_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPageController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  void signUp(){
      try{
        AppApi.firebaseAuth.createUserWithEmailAndPassword(email: emailController.text,
            password: passwordController.text,
        ).then((value){
          AppApi.firebaseAuth.currentUser?.updateDisplayName(userNameController.text);
        });
      }catch(e){

      }
  }

  void gotoSignIn(){
    Get.toNamed(AppRouteConfig.signInRoute);
  }
  void clearController(){
    emailController.clear();
    passwordController.clear();
  }
}