

import 'package:child_future/config/route_config.dart';
import 'package:child_future/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../views/organization_view.dart';
import '../views/victim_view.dart';

class HomePageController extends GetxController{
    final  indexPages = [
      homeView(),
      OrganizationView(),
      VictimView(),
    ];

    RxInt selectedIndex = 0.obs;
    void onPageTap(int value){
      selectedIndex.value = value;
    }

    void gotoReportChild()=>Get.toNamed(AppRouteConfig.reportChildRoute);
}