import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/di/api_client.dart';
import '../core/di/api_provider.dart';
import '../core/di/get_di.dart' as di;

class LoginRepo {
  final ApiClient apiClient;
  LoginRepo({required this.apiClient});

  Future<Response> login(dynamic body) => apiClient.postAPI(ApiProvider.driverLogin, body,useHeader: false);

  saveLoginData(String token) async{
    await di.init();
    apiClient.updateHeader(token);
    apiClient.sharedPreferences.setString(ApiProvider.preferencesToken, token);
    apiClient.sharedPreferences.setBool(ApiProvider.preferencesIsLogin, true);
  }
}