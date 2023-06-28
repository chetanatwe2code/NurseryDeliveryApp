import 'package:get/get.dart';
import 'package:nursery_driver/repository/order_repo.dart';

import '../../controller/home_logic.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OrderRepo(apiClient: Get.find()));
    Get.lazyPut(() => HomeLogic(orderRepo: Get.find()));
  }
}
