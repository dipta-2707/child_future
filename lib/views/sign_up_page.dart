import 'package:child_future/controller/sign_up_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpPageController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ListView(
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
      const SizedBox(height: 10.0,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ElevatedButton(onPressed: (){
                    controller.signUp();
                },
            child: const Text('Sign Up')),
      ),
      const SizedBox(height: 30.0,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Already have an account?'),
          TextButton(onPressed: (){
            controller.gotoSignIn();
          },
              child: Text('Sign In',style: Get.textTheme.bodyMedium, ))
        ],
      )
        ],
      )),
    );
  }
}
