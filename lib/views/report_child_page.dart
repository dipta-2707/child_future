import 'dart:io';

import 'package:child_future/controller/report_child_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Api.dart';
import '../model/victim_model.dart';

class ReportChildPage extends GetView<ReportChildController> {
  const ReportChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report A Child'),
        actions: [
          IconButton(
              onPressed: () {
                controller.postAReport();
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: Get.height * 0.2,
              width: Get.width,
              child: Obx(
                () => controller.isImagePicked.value
                    ? Stack(
                        children: [
                          Obx(
                            () => Image.file(
                              File(controller.imagePath.value),
                              width: Get.width,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Positioned(
                            child: IconButton(
                              onPressed: () {
                                controller.imagePicker();
                              },
                              icon: const Icon(Icons.camera_alt),
                            ),
                          )
                        ],
                      )
                    : IconButton(
                        onPressed: () {
                          controller.imagePicker();
                        },
                        icon: const Icon(Icons.camera_alt),
                      ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text('Child Name'),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: controller.nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Enter child name'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text('Address'),
            const SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: controller.addressController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Enter address'),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text('Your Added Child'),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: StreamBuilder(
                  stream: AppApi.getVictims(isOnlyMe: true),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                          itemBuilder: (context, index) => _victimTile(
                                victimModel: VictimModel.fromJson(
                                    snapshot.data!.docs[index].data()),
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 8.0,
                              ),
                          itemCount: snapshot.data!.size);
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget _victimTile({required VictimModel victimModel}) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.blueGrey)),
      child: ListTile(
        onTap: () {
          Get.defaultDialog(
              title: victimModel.name,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    victimModel.image,
                    fit: BoxFit.cover,
                    height: Get.height * 0.3,
                    width: Get.width,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text('Address: ${victimModel.address}'),
                  Text('Receive: ${victimModel.isReceive}'),
                ],
              ));
        },
        leading: Image.network(
          victimModel.image,
          fit: BoxFit.fill,
        ),
        title: Text(victimModel.name),
        trailing: const Icon(Icons.arrow_circle_right),
      ),
    );
  }
}
