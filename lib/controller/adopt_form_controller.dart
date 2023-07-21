import 'dart:io';

import 'package:child_future/Api.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdoptFormController extends GetxController{

    TextEditingController fatherName = TextEditingController();
    TextEditingController motherName = TextEditingController();
    TextEditingController fatherNid = TextEditingController();
    TextEditingController motherNid = TextEditingController();
    TextEditingController presentAddress = TextEditingController();
    TextEditingController permanentAddress = TextEditingController();
    TextEditingController sourceOfIncomeFather = TextEditingController();
    TextEditingController sourceOfIncomeMother = TextEditingController();
    TextEditingController monthlyIncomeFather = TextEditingController();
    TextEditingController monthlyIncomeMother = TextEditingController();
    TextEditingController yearlyIncomeFather = TextEditingController();
    TextEditingController yearlyIncomeMother = TextEditingController();
    TextEditingController adoptBabyOld = TextEditingController();

    /// validate all field
    bool validateALlField(){
      if(fatherName.text.isEmpty || motherName.text.isEmpty || fatherNid.text.isEmpty ||
        motherNid.text.isEmpty
        || presentAddress.text.isEmpty
        || permanentAddress.text.isEmpty
        || sourceOfIncomeMother.text.isEmpty
        || sourceOfIncomeFather.text.isEmpty
        || monthlyIncomeMother.text.isEmpty
        || monthlyIncomeFather.text.isEmpty
        || yearlyIncomeMother.text.isEmpty
        || yearlyIncomeFather.text.isEmpty
        || adoptBabyOld.text.isEmpty
      ){
        return false;
      }
      return true;
    }
    
    void submitForm()async{

      //storage file ref with path
      final ref =AppApi.firebaseStorage.ref().child(
          'bankStatement/${imagePath.split('.')[0].split("/").last}');

      //uploading image
      await ref
          .putFile(File(imagePath.value), SettableMetadata(contentType: 'image/'))
          .then((p0) {});

      var imageUrl = await ref.getDownloadURL();


        Map<String, dynamic> data = {};
        data["fatherName"] = fatherName.text.trim();
        data["motherName"] = motherName.text.trim();
        data["fatherNid"] = fatherNid.text.trim();
        data["presentAddress"] = presentAddress.text.trim();
        data["permanentAddress"] = permanentAddress.text.trim();
        data["sourceOfIncomeFather"] = sourceOfIncomeFather.text.trim();
        data["sourceOfIncomeMother"] = sourceOfIncomeMother.text.trim();
        data["monthlyIncomeFather"] = monthlyIncomeFather.text.trim();
        data["yearlyIncomeFather"] = yearlyIncomeFather.text.trim();
        data["yearlyIncomeMother"] = yearlyIncomeMother.text.trim();
        data["adoptBabyOld"] = adoptBabyOld.text.trim();
        data["bankStatement"] = imageUrl;


      await AppApi.firebaseStore.collection('adoptRequests').doc().set(data);

    clearText();
        clearImage();

    }
    @override
  void dispose() {
        fatherName.dispose();
        motherName.dispose();
        fatherNid.dispose();
        motherNid.dispose();
        presentAddress.dispose();
        permanentAddress.dispose();
        sourceOfIncomeFather.dispose();
        sourceOfIncomeMother.dispose();
        monthlyIncomeFather.dispose();
        monthlyIncomeMother.dispose();
        yearlyIncomeFather.dispose();
        yearlyIncomeMother.dispose();
        adoptBabyOld.dispose();
        super.dispose();
  }

    void clearText(){
        fatherName.clear();
         motherName.clear();
         fatherNid.clear();
         motherNid.clear();
         presentAddress.clear();
         permanentAddress.clear();
         sourceOfIncomeFather.clear();
         sourceOfIncomeMother.clear();
         monthlyIncomeFather.clear();
         monthlyIncomeMother.clear();
         yearlyIncomeFather.clear();
         yearlyIncomeMother.clear();
         adoptBabyOld.clear();
    }

    RxBool isImagePicked = false.obs;
    RxString imagePath = "".obs;
    void imagePicker() async {
      final ImagePicker picker = ImagePicker();
      // Pick an image.
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        imagePath.value = image.path;
        isImagePicked.value = true;
      }
    }

    void clearImage(){
      isImagePicked.value = false;
      imagePath.value = "";
    }
}