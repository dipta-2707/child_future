import 'package:child_future/controller/forget_pass_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassPage extends StatelessWidget {
  const ForgetPassPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPassController controller = Get.put(ForgetPassController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const Text(
                "Enter your account email address.We will sent you a reset password link"),
            SizedBox(
              height: 12.0,
            ),
            TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                  labelText: 'User Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email)),
            ),
            SizedBox(
              height: 12.0,
            ),
            ElevatedButton(
                onPressed: () {
                  controller.sentLink();
                },
                child: const Text('sent link'))
          ],
        ),
      ),
    );
  }
}
