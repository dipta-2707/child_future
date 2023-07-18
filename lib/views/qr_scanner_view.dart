import 'package:child_future/controller/qr_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerView extends StatelessWidget {
  const QrScannerView({super.key});

  @override
  Widget build(BuildContext context) {
    QrController controller = Get.put(QrController());
    return Center(
        child: Obx(
          ()=>controller.isScanning.value?
              SizedBox(
            height: Get.height * 0.4,
            width: Get.width *0.8,
            child: MobileScanner(
              onDetect: (barcodes){
                if(controller.isScanning.value){
                  try{
                    controller.qrScanProcess(barcodes.raw[0]['rawValue']);
                  }catch(_){}
                }


            },),
          ) : CircularProgressIndicator(),
        ),
    );
  }
}
