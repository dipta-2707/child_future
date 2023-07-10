import 'dart:convert';

import 'package:child_future/Api.dart';
import 'package:child_future/model/organization_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrganizationView extends StatelessWidget {
  const OrganizationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SearchBar(
            hintText: 'Search by name...',
          ),
          SizedBox(
            height: 12.0,
          ),
          Expanded(
            child: StreamBuilder(
                stream: AppApi.getOrganizations(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                        itemBuilder: (context, index) {
                          return _organizationTile(
                              organizationModel: OrganizationModel.fromJson(
                                  snapshot.data!.docs[index].data()));
                        },
                        separatorBuilder: (context, index) => SizedBox(
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
          fit: BoxFit.fill,
        ),
        title: Text(organizationModel.name),
        subtitle: Text(organizationModel.email),
        trailing: Icon(Icons.arrow_circle_right),
      ),
    );
  }
}
