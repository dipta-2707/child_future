import 'dart:convert';

import 'package:child_future/controller/home_page_controller.dart';
import 'package:child_future/model/victim_model.dart';
import 'package:child_future/views/victim_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../Api.dart';

class VictimView extends GetView<HomePageController> {
  const VictimView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [

          SearchBar(
            hintText: 'Search by name...',
            controller: controller.vicSearchController,
            onChanged: (value) {
              if (controller.vicSearchController.text.isNotEmpty) {
                controller.vicFilterDocuments.value = controller.vicDocuments.where((element) {
                  return element
                      .get('name')
                      .toString()
                      .toLowerCase()
                      .contains(controller.vicSearchController.text.toLowerCase());
                }).toList();
              }else{
                controller.vicFilterDocuments.value = controller.vicDocuments;
              }
            },
          ),
          SizedBox(
            height: 12.0,
          ),
          Expanded(
            child: StreamBuilder(
                stream: AppApi.getVictims(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    controller.vicDocuments.value = snapshot.data!.docs;
                    controller.vicFilterDocuments.value =  snapshot.data!.docs;
                    return Obx(
                      ()=> ListView.separated(
                          itemBuilder: (context, index) => _victimTile(
                            docId: controller.vicFilterDocuments[index].id,
                                victimModel: VictimModel.fromRawJson(
                                    jsonEncode(controller.vicFilterDocuments[index].data())),
                              ),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 8.0,
                              ),
                          itemCount: controller.vicFilterDocuments.length),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          )
        ],
      ),
    );
  }

  Widget _victimTile({required VictimModel victimModel, required String docId}) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.blueGrey)),
      child: ListTile(
        onTap: () {
          Get.to(()=>VictimDetailsPage(victimModel: victimModel,docId: docId,));

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
