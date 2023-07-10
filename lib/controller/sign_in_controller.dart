import 'package:child_future/Api.dart';
import 'package:child_future/config/route_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInPageController extends GetxController{
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();


    void signIn(){
        try{
            AppApi.firebaseAuth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text)
                .then((value){
                clearController();
                Get.offAndToNamed(AppRouteConfig.homeRoute);
            }
            );
        }catch(error){
           Get.snackbar('Error',error.toString());
           clearController();
        }
        //Get.offAndToNamed(AppRouteConfig.homeRoute);
    }

    void gotoForgetPassword(){

    }

    void gotoSignUp(){
        Get.toNamed(AppRouteConfig.signUpRoute);
    }

    void clearController(){
        emailController.clear();
        passwordController.clear();
    }
}