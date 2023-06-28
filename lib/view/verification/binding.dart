import 'package:get/get.dart';
import 'package:nursery_driver/repository/verification_repo.dart';

import 'logic.dart';

class VerificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationRepo(apiClient: Get.find()));
    Get.lazyPut(() => VerificationLogic(verificationRepo: Get.find()));
  }
}
