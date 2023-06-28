import 'package:get/get.dart';

import 'logic.dart';

class VehicleListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VehicleListLogic(apiClient: Get.find()));
  }
}
