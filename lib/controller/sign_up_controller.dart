import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPageController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  final formKey = GlobalKey<FormState>();
}