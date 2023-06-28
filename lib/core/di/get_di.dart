import 'package:get/get.dart';
import 'package:nursery_driver/repository/order_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../controller/account_logic.dart';
import '../../controller/home_logic.dart';
import '../../view/deliver_completed/logic.dart';
import '../../controller/history_logic.dart';
import '../../repository/account_repo.dart';
import 'api_client.dart';
import 'api_provider.dart';

Future<void> init() async {

  // Core
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.put(sharedPreferences, permanent: true);
  Get.put(ApiClient(sharedPreferences: Get.find(),apkBaseUrl: ApiProvider.baseUrl), permanent: true);

  // Repository
  Get.lazyPut(() => AccountRepo(apiClient: Get.find()));
  Get.lazyPut(() => OrderRepo(apiClient: Get.find()));
  Get.lazyPut(() => HistoryLogic(apiClient: Get.find()));

  // Getx Controller And GetxService
  Get.lazyPut(() => AccountLogic(accountRepo: Get.find()));
  Get.lazyPut(() => HomeLogic(orderRepo: Get.find()));
  Get.lazyPut(() => DeliverCompletedLogic(apiClient: Get.find()));

}