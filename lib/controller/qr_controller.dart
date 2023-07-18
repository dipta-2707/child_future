import 'package:child_future/model/victim_model.dart';
import 'package:child_future/views/victim_details_page.dart';
import 'package:get/get.dart';

import '../Api.dart';

class QrController extends GetxController{
  RxBool isScanning = true.obs;

  void qrScanProcess(String value)async{

    isScanning.value = false;
    await AppApi.firebaseStore.collection('victims').doc(value).get().then((res)  {
      print('------------------ ${res.data()} -----------------');

      if(res.data() != null){
        isScanning.value = true;
        Get.to(()=>VictimDetailsPage(victimModel: VictimModel.fromJson(res.data()!), docId: res.id) );
      }

    });
    isScanning.value = true;
  }
}