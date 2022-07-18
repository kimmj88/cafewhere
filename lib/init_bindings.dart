import 'package:get/get.dart';
import 'package:flutter_application_1/bottom_nav_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottmNavController(), permanent: true);
  }
}
