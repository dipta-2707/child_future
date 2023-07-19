import 'package:child_future/controller/sign_in_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInPageController> {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0)),
            child: Image.asset(
              'assets/child01.jpeg',
              height: Get.height * 0.3,
              width: Get.width,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(
            height: 10.0,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Sign In',
                style: Get.textTheme.displaySmall,
              )),
          // email
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                  labelText: 'Email', prefixIcon: Icon(Icons.email)),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          // password
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextFormField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: 'Password', prefixIcon: Icon(Icons.key)),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextButton(
                  onPressed: () {
                    controller.gotoForgetPassword();
                  },
                  child: Text(
                    'forget password?',
                    style: Get.textTheme.bodySmall,
                  )),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
                onPressed: () {

                    controller.signIn();

                },
                child: const Text('Sign In')),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Do not have an account?'),
              TextButton(
                  onPressed: () {
                    controller.gotoSignUp();
                  },
                  child: Text(
                    'Sign Up',
                    style: Get.textTheme.bodyMedium,
                  ))
            ],
          )
        ],
      )),
    );
  }
}
