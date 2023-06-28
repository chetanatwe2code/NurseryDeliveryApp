import 'package:get/get.dart';

import 'logic.dart';

class AddVehicleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddVehicleLogic(apiClient: Get.find()));
  }
}
