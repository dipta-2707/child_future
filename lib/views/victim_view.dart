import 'dart:convert';

import 'package:child_future/model/victim_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Api.dart';

class VictimView extends StatelessWidget {
  const VictimView({super.key});

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
                stream: AppApi.getVictims(),
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
                  Text('Address: ${victimModel.address}')
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
