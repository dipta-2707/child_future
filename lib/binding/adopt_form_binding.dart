import 'package:child_future/controller/adopt_form_controller.dart';
import 'package:get/get.dart';

class AdoptFormBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AdoptFormController());
  }

}