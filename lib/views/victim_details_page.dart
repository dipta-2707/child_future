import 'package:child_future/model/victim_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class VictimDetailsPage extends StatelessWidget {
  final VictimModel victimModel;
  final String docId;
  const VictimDetailsPage({super.key, required this.victimModel, required this.docId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 13.0),
        child: Column(
          children: [
            Image.network(
              victimModel.image,
              fit: BoxFit.cover,
              height: Get.height * 0.3,
              width: Get.width,
            ),
            const SizedBox(height: 12.0,),
            Text('Name: ${victimModel.name}',
            style: Get.textTheme.headlineSmall,
            ),
            Text('Address: ${victimModel.address}'),
            Text('Receive: ${victimModel.isReceive}'),

            QrImageView(
              data: docId.trim(),
              version: QrVersions.auto,
              size: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
