import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/di/api_client.dart';
import '../core/di/api_provider.dart';

class AccountRepo{
  final ApiClient apiClient;
  AccountRepo({required this.apiClient});

  Future<Response> getAccountDetails() => apiClient.getAPI(ApiProvider.driverDetails);
  Future<Response> driverUpdate(FormData body) => apiClient.putAPI(ApiProvider.driverUpdate,body);
  Future<Response> updateFCMToken(dynamic  body) => apiClient.putAPI(ApiProvider.setNotificationToken,body);

}