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
              SizedBox(height: 10.0,),
            Text('General information'),
            SizedBox(height: 10.0,),
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
            SizedBox(height: 10.0,),
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
            SizedBox(height: 10.0,),
            Text('Address information'),
            SizedBox(height: 10.0,),
            TextFormField(
              controller: controller.presentAddress,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Present address'
              ),
            ),
            SizedBox(height: 10.0,),
            TextFormField(
              controller: controller.permanentAddress,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Permanent Address'
              ),
            ),
            SizedBox(height: 10.0,),
            SizedBox(height: 10.0,),
            Text('Income source'),
            SizedBox(height: 10.0,),
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
            SizedBox(height: 10.0,),
            const Text('Monthly income'),
            SizedBox(height: 10.0,),
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
            SizedBox(height: 10.0,),
            const Text('Yearly income'),
            SizedBox(height: 10.0,),
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
            const Text('Adopt baby old'),
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
              controller.submitForm();
            },
                child: const Text('Submit'))
          ],
        ),
      ),
    );
  }
}
