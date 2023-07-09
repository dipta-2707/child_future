import 'package:child_future/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpPageController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Form(child: ListView(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0)
            ),
            child: Image.asset('assets/child02.jpeg',
              height: Get.height * 0.3,
              width: Get.width,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10.0,),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Sign Up',style: Get.textTheme.displaySmall,)),
          // Username
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              controller: controller.userNameController,
              validator: (value) {

                if(value == null || value.isEmpty ){
                  return 'enter your Name.';
                }

                return null;
              },
              decoration: const InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person)
              ),
            ),
          ),
          const SizedBox(height: 10.0,),
          // email
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              controller: controller.emailController,
              validator: (value) {

                if(value == null || value.isEmpty || !value.contains('@')){
                  return 'enter a valid email.';
                }

                return null;
              },
              decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email)
              ),
            ),
          ),
          const SizedBox(height: 10.0,),
          // password
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.key)
              ),
            ),
          ),
          const SizedBox(height: 8.0,),
        ],
      ))),
    );
  }
}
