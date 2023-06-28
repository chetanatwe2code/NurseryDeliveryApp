import 'package:get/get.dart';

import '../core/di/api_client.dart';
import '../core/di/api_provider.dart';
import '../core/di/get_di.dart' as di;

class VerificationRepo {
  final ApiClient apiClient;
  VerificationRepo({required this.apiClient});

  Future<Response> verify(dynamic body) => apiClient.postAPI(ApiProvider.driverVerify,body,useHeader: false);

  Future<Response> resentOtp(dynamic body,bool isForgot) => apiClient.postAPI(isForgot?ApiProvider.driverForgotPassword:ApiProvider.driverRegister,body,useHeader: false);


  saveLoginData(String token) async{
    await di.init();
    apiClient.updateHeader(token);
    apiClient.sharedPreferences.setString(ApiProvider.preferencesToken, token);
    apiClient.sharedPreferences.setBool(ApiProvider.preferencesIsLogin, true);
  }

}