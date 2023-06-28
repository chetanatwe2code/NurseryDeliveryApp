import 'package:get/get.dart';

import 'logic.dart';

class OrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderDetailsLogic(apiClient: Get.find()));
  }
}
