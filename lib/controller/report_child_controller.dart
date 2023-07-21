import 'dart:io';

import 'package:child_future/Api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ReportChildController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  RxBool isImagePicked = false.obs;
  RxString imagePath = "".obs;

  void postAReport() {
    if (nameController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        imagePath.value.isNotEmpty) {
      AppApi.postVictimData(
        name: nameController.text,
        address: addressController.text,
        file: File(imagePath.value),
      ).then((value) {
        clearController();

        Get.snackbar('Success', 'Successfully victim uploaded');
      });
    } else {
      Get.snackbar('Error', 'Need all filed data.');
    }
  }

  void clearController() {
    nameController.clear();
    addressController.clear();
    isImagePicked.value = false;
    imagePath.value = "";
  }

  void imagePicker() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      imagePath.value = image.path;
      isImagePicked.value = true;
    }
  }

}
