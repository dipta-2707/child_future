import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:child_future/Api.dart';
import 'package:child_future/controller/home_page_controller.dart';
import 'package:child_future/model/organization_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class OrganizationView extends GetView<HomePageController> {
  const OrganizationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SearchBar(
            hintText: 'Search by name...',
            controller: controller.orgSearchController,
            onChanged: (value) {
              if (controller.orgSearchController.text.isNotEmpty) {
                controller.orgFilterDocuments.value = controller.orgDocuments.where((element) {
                  return element
                      .get('name')
                      .toString()
                      .toLowerCase()
                      .contains(controller.orgSearchController.text.toLowerCase());
                }).toList();
              }else{
                controller.orgFilterDocuments.value = controller.orgDocuments;
              }
              print(controller.orgFilterDocuments);
            },
          ),
          SizedBox(
            height: 12.0,
          ),
          Expanded(
            child: StreamBuilder(
                stream: AppApi.getOrganizations(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    controller.orgDocuments.value = snapshot.data!.docs;
                    controller.orgFilterDocuments.value =  snapshot.data!.docs;
                    return Obx(
                        ()=> ListView.separated(
                          itemBuilder: (context, index) {
                            return _organizationTile(
                                organizationModel: OrganizationModel.fromRawJson(
                                    jsonEncode(controller.orgFilterDocuments[index].data())));
                          },
                          separatorBuilder: (context, index) =>const SizedBox(
                                height: 8.0,
                              ),
                          itemCount: controller.orgFilterDocuments.length),
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

  Widget _organizationTile({required OrganizationModel organizationModel}) {
    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.blueGrey)),
      child: ListTile(
        onTap: () {
          Get.defaultDialog(
              title: organizationModel.name,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    organizationModel.image,
                    width: Get.width,
                    height: Get.height * 0.25,
                  ),
                  Text('Email: ${organizationModel.email}'),
                  Text('Phone: ${organizationModel.phone}'),
                  Text('Location: ${organizationModel.location}'),
                  Text('NID: ${organizationModel.nid}'),
                  Text('Total Seat: ${organizationModel.totalSeat}'),
                  Text('Free Seat: ${organizationModel.freeSeat}')
                ],
              ));
        },
        leading: Image.network(
          organizationModel.image,
          fit: BoxFit.cover,
        ),
        title: Text(organizationModel.name),
        subtitle: Text(organizationModel.email),
        trailing: IconButton(onPressed: ()async{
          Uri phoneno = Uri(scheme: 'tel', path: '+8801746841260');
          await launchUrl(phoneno);
        },
            icon: const Icon(Icons.phone)),
      ),
    );
  }
}
