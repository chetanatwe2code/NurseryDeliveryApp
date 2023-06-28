import 'package:get/get.dart';

import '../core/di/api_client.dart';
import '../core/di/api_provider.dart';

class ForgotPasswordRepo {
  final ApiClient apiClient;
  ForgotPasswordRepo({required this.apiClient});

  Future<Response> forgotPassword(dynamic body) => apiClient.postAPI(ApiProvider.driverForgotPassword,body,useHeader: false);

}