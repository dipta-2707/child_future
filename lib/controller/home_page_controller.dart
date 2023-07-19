

import 'package:child_future/config/route_config.dart';
import 'package:child_future/views/home_view.dart';
import 'package:child_future/views/qr_scanner_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../views/organization_view.dart';
import '../views/victim_view.dart';

class HomePageController extends GetxController{
    final  indexPages = [
      homeView(),
      OrganizationView(),
      VictimView(),
      QrScannerView()
    ];

    RxInt selectedIndex = 0.obs;
    void onPageTap(int value){
      selectedIndex.value = value;
    }

    RxList<DocumentSnapshot> orgDocuments = <DocumentSnapshot>[].obs;
    RxList<DocumentSnapshot> orgFilterDocuments = <DocumentSnapshot>[].obs;

    TextEditingController orgSearchController = TextEditingController();

    RxList<DocumentSnapshot> vicDocuments = <DocumentSnapshot>[].obs;
    RxList<DocumentSnapshot> vicFilterDocuments = <DocumentSnapshot>[].obs;

    TextEditingController vicSearchController = TextEditingController();

    void gotoReportChild()=>Get.toNamed(AppRouteConfig.reportChildRoute);
}