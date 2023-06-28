import 'package:get/get.dart';

import '../core/di/api_client.dart';
import '../core/di/api_provider.dart';

class ChangePasswordRepo{
  final ApiClient apiClient;
  ChangePasswordRepo({required this.apiClient});

  String? getToken() => apiClient.sharedPreferences.getString(ApiProvider.preferencesToken);


  Future<Response> changePassword(dynamic body,String? token) => apiClient.postAPI(ApiProvider.changePassword, body,headers: { "driver_token": "$token" });



}