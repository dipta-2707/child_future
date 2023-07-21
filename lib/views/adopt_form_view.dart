import 'dart:io';

import 'package:child_future/controller/adopt_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdoptFormView extends GetView<AdoptFormController> {
  const AdoptFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
      ),
      body:  Padding(padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 13.0),
        child: ListView(
          children: [
            const Text('Please fill up this form carefully.'),
              const SizedBox(height: 10.0,),
            const Text('General information', style: TextStyle(
              fontWeight: FontWeight.w500
            ),),
            const SizedBox(height: 10.0,),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controller.fatherName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Father Name'
                      ),
                    ),
                  ),
            const SizedBox(width: 10.0,),
            Expanded(
              child: TextFormField(
                    controller: controller.motherName,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mother Name'
                    ),
              ),
            ),
                ],
              ),
            const SizedBox(height: 10.0,),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.fatherNid,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Father Nid'
                    ),
                  ),
                ),
                const SizedBox(width: 10.0,),
                Expanded(
                  child: TextFormField(
                    controller: controller.motherNid,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mother Nid'
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0,),
            /// father mother image section ------------------------ >>>>
            Row(
              children: [
                Expanded(child: Container(
                  width: Get.width,
                  height: Get.height * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey
                  ),
                  child: Obx(
                        ()=> Stack(
                      alignment: Alignment.center,
                      children: [
                        controller.isImagePickedFather.value?
                        Image.file(
                          File(controller.imagePathFather.value),
                          width: Get.width,
                          fit: BoxFit.fill,
                        ) : const SizedBox(),
                        IconButton(onPressed: (){
                          !controller.isImagePickedFather.value ?
                          controller.imagePickerFather() :
                          controller.clearImageFather();
                        },
                            icon:  Icon(controller.isImagePickedFather.value?Icons.cancel : Icons.upload, size: 28,
                              color: !controller.isImagePickedFather.value? Colors.blue : Colors.red,)),
                      ],
                    ),
                  ),
                )),
                const SizedBox(width: 10.0,),
                Expanded(child: Container(
                  width: Get.width,
                  height: Get.height * 0.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey
                  ),
                  child: Obx(
                        ()=> Stack(
                      alignment: Alignment.center,
                      children: [
                        controller.isImagePickedMother.value?
                        Image.file(
                          File(controller.imagePathMother.value),
                          width: Get.width,
                          fit: BoxFit.fill,
                        ) : const SizedBox(),
                        IconButton(onPressed: (){
                          !controller.isImagePickedMother.value ?
                          controller.imagePickerMother() :
                          controller.clearImageMother();
                        },
                            icon:  Icon(controller.isImagePickedMother.value?Icons.cancel : Icons.upload, size: 28,
                              color: !controller.isImagePickedMother.value? Colors.blue : Colors.red,)),
                      ],
                    ),
                  ),
                ))
              ],
            ),
            const SizedBox(height: 10.0,),

            const Text('Address information',style: TextStyle(
                fontWeight: FontWeight.w500
            )),
            const SizedBox(height: 10.0,),
            TextFormField(
              controller: controller.presentAddress,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Present address'
              ),
            ),
            const SizedBox(height: 10.0,),
            TextFormField(
              controller: controller.permanentAddress,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Permanent Address'
              ),
            ),
            const SizedBox(height: 10.0,),
            const SizedBox(height: 10.0,),
            const Text('Income source',style: TextStyle(
              fontWeight: FontWeight.w500
            ),),
            const SizedBox(height: 10.0,),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.sourceOfIncomeFather,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Father'
                    ),
                  ),
                ),
                const SizedBox(width: 10.0,),
                Expanded(
                  child: TextFormField(
                    controller: controller.sourceOfIncomeMother,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mother'
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0,),


            const Text('Bank Statement',style: TextStyle(
                fontWeight: FontWeight.w500
            ),),
            Container(
              width: double.infinity,
              height: Get.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.grey
              ),
              child: Obx(
                ()=> Stack(
                  alignment: Alignment.center,
                  children: [
                    controller.isImagePickedBank.value?
                    Image.file(
                      File(controller.imagePathBank.value),
                      width: Get.width,
                      fit: BoxFit.fill,
                    ) : const SizedBox(),
                    IconButton(onPressed: (){
                      !controller.isImagePickedBank.value ?
                      controller.imagePickerBank() :
                      controller.clearImageBank();
                    },
                        icon:  Icon(controller.isImagePickedBank.value?Icons.cancel : Icons.upload, size: 28,
                          color: !controller.isImagePickedBank.value? Colors.blue : Colors.red,)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10.0,),
            const Text('Monthly income',style: TextStyle(
                fontWeight: FontWeight.w500
            ),),
            const SizedBox(height: 10.0,),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.monthlyIncomeFather,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Father'
                    ),
                  ),
                ),
                const SizedBox(width: 10.0,),
                Expanded(
                  child: TextFormField(
                    controller: controller.monthlyIncomeMother,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mother'
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0,),
            const Text('Yearly income',style: TextStyle(
                fontWeight: FontWeight.w500
            ),),
            const SizedBox(height: 10.0,),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.yearlyIncomeFather,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Father'
                    ),
                  ),
                ),
                const SizedBox(width: 10.0,),
                Expanded(
                  child: TextFormField(
                    controller: controller.yearlyIncomeMother,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mother'
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0,),
            const Text('Adopt baby age',style: TextStyle(
                fontWeight: FontWeight.w500
            ),),
            const SizedBox(height: 10.0,),
            TextFormField(
              controller: controller.adoptBabyOld,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Child age'
              ),
            ),
            const SizedBox(height: 20.0,),
            ElevatedButton(onPressed: (){
              if(controller.isImagePickedFather.value && controller.isImagePickedMother.value &&  controller.isImagePickedBank.value && controller.validateALlField()){
                controller.submitForm();
              }else{
                Get.snackbar('Error', 'all field is required.', backgroundColor: Colors.red);
              }

            },
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
