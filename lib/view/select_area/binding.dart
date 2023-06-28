import 'package:get/get.dart';

import 'logic.dart';

class SelectAreaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SelectAreaLogic());
  }
}
