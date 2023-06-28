import 'package:get/get.dart';

import 'logic.dart';

class AddWorkingAreaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddWorkingAreaLogic(apiClient: Get.find()));
  }
}
