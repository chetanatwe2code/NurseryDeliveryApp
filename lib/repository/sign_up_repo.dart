import 'package:get/get.dart';

import '../core/di/api_client.dart';
import '../core/di/api_provider.dart';
import '../core/di/get_di.dart' as di;

class SignUpRepo{
  final ApiClient apiClient;
  SignUpRepo({required this.apiClient});

  Future<Response> signUp(dynamic body) => apiClient.postAPI(ApiProvider.driverRegister, body,useHeader: false);

  saveLoginData(String token) async{
    await di.init();
    apiClient.updateHeader(token);
    apiClient.sharedPreferences.setString(ApiProvider.preferencesToken, token);
    apiClient.sharedPreferences.setBool(ApiProvider.preferencesIsLogin, true);
  }
}