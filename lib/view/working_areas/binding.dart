import 'package:get/get.dart';

import 'logic.dart';

class WorkingAreasBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WorkingAreasLogic(apiClient: Get.find()));
  }
}
