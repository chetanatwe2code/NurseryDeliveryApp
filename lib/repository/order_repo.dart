import 'package:get/get_connect/http/src/response/response.dart';

import '../core/di/api_client.dart';
import '../core/di/api_provider.dart';

class OrderRepo{
  final ApiClient apiClient;
  OrderRepo({required this.apiClient});


  Future<Response> getOrder(dynamic body) => apiClient.postAPI(ApiProvider.getOrder,body);

}