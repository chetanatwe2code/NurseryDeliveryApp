import 'package:get/get.dart';

import '../../controller/history_logic.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryLogic(apiClient: Get.find()));
  }
}
