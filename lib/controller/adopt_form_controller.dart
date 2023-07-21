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
      final refBank =AppApi.firebaseStorage.ref().child(
          'bankStatement/${imagePathBank.split('/').last}');

      // father ref
      final refFather =AppApi.firebaseStorage.ref().child(
          'parentsImage/${imagePathFather.split('/').last}');

      // mother ref
      final refMother =AppApi.firebaseStorage.ref().child(
          'parentsImage/${imagePathMother.split('/').last}');

      //uploading image
      await refBank
          .putFile(File(imagePathBank.value), SettableMetadata(contentType: 'image/jpg'))
          .then((p0) {});


      await refFather
          .putFile(File(imagePathFather.value), SettableMetadata(contentType: 'image/jpg'))
          .then((p0) {});


      await refMother
          .putFile(File(imagePathMother.value), SettableMetadata(contentType: 'image/jpg'))
          .then((p0) {});

      var imageUrlBank = await refBank.getDownloadURL();

      var imageUrlFather = await refFather.getDownloadURL();

      var imageUrlMother = await refMother.getDownloadURL();


        Map<String, dynamic> data = {};
        data["fatherName"] = fatherName.text.trim();
        data["motherName"] = motherName.text.trim();
        data["fatherImage"] = imageUrlFather;
        data["motherImage"] = imageUrlMother;
        data["fatherNid"] = fatherNid.text.trim();
        data["presentAddress"] = presentAddress.text.trim();
        data["permanentAddress"] = permanentAddress.text.trim();
        data["sourceOfIncomeFather"] = sourceOfIncomeFather.text.trim();
        data["sourceOfIncomeMother"] = sourceOfIncomeMother.text.trim();
        data["monthlyIncomeFather"] = monthlyIncomeFather.text.trim();
        data["yearlyIncomeFather"] = yearlyIncomeFather.text.trim();
        data["yearlyIncomeMother"] = yearlyIncomeMother.text.trim();
        data["adoptBabyOld"] = adoptBabyOld.text.trim();
        data["bankStatement"] = imageUrlBank;


    //  await AppApi.firebaseStore.collection('adoptRequests').doc().set(data);

      clearText();
      clearImageBank();
      clearImageFather();
      clearImageMother();

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

    RxBool isImagePickedBank = false.obs;
    RxString imagePathBank = "".obs;
    void imagePickerBank() async {
      final ImagePicker picker = ImagePicker();
      // Pick an image.
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        imagePathBank.value = image.path;
        isImagePickedBank.value = true;
      }
    }

    void clearImageBank(){
      isImagePickedBank.value = false;
      imagePathBank.value = "";
    }

    /// father image picker
    RxBool isImagePickedFather = false.obs;
    RxString imagePathFather = "".obs;
    void imagePickerFather() async {
      final ImagePicker picker = ImagePicker();
      // Pick an image.
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        imagePathFather.value = image.path;
        isImagePickedFather.value = true;
      }
    }

    void clearImageFather(){
      isImagePickedFather.value = false;
      imagePathBank.value = "";
    }

    /// mother image picker
    RxBool isImagePickedMother = false.obs;
    RxString imagePathMother = "".obs;
    void imagePickerMother() async {
      final ImagePicker picker = ImagePicker();
      // Pick an image.
      final XFile? image = await picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        imagePathMother.value = image.path;
        isImagePickedMother.value = true;
      }
    }
    void clearImageMother(){
      isImagePickedBank.value = false;
      imagePathBank.value = "";
    }


}