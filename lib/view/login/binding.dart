import 'package:get/get.dart';
import 'package:nursery_driver/repository/login_repo.dart';

import 'logic.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginRepo(apiClient:  Get.find()));
    Get.lazyPut(() => LoginLogic(loginRepo: Get.find()));
  }
}
