import 'package:child_future/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              const SizedBox(height: 10.0),
              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                    labelText: 'User Name',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person)),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.key)),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                    labelText: 'User Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email)),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                  onPressed: () {
                    controller.updateProfile();
                  },
                  child: const Text('Update Profile')),
              const SizedBox(height: 20.0),
              ElevatedButton(
                  onPressed: () {
                    controller.logout();
                  },
                  child: const Text('Logout')),
            ],
          ),
        ),
      ),
    );
  }
}
