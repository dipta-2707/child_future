import 'package:child_future/controller/report_child_controller.dart';
import 'package:get/get.dart';

class ReportChildBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => ReportChildController());
  }

}