import 'package:child_future/Api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

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
    
    void submitForm()async{
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

      await  AppApi.firebaseStore.collection('adoptRequests').doc()
            .set(data);
        clearText();

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
}