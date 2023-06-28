import 'package:get/get.dart';
import 'package:nursery_driver/core/di/api_provider.dart';
import 'package:nursery_driver/model/OrderModel.dart';

import '../../core/di/api_client.dart';
import '../../model/ProductModel.dart';

class OrderDetailsLogic extends GetxController {
  final ApiClient apiClient;
  OrderDetailsLogic({required this.apiClient});

  dynamic argumentData = Get.arguments;

  OrderModel? orderModel;
  @override
  void onInit() {
    orderModel = OrderModel.fromJson(argumentData?['orderModel']);
    super.onInit();
  }

  List<ProductModel> pList = [];

  bool getProcess = false;
  bool noInternet = false;
  getOrderProduct(){
    getProcess = true;
    pList.clear();
    update();
    apiClient.getAPI("${ApiProvider.getOrderProduct}?id=${orderModel?.orderId}").then((value) => {
      getProcess = false,
      print("ORDER_PRODUCT ${value.body}"),
      if(value.statusCode == -1){
        noInternet = true,
        update(),
      }else{
        if(value.body['success'] == true){
          value.body['order_product_detaile'].forEach((v){
            pList.add(ProductModel.fromJson(v));
          }),
        },
        update(),
      }
    },onError: (e){
      getProcess = false;
      if(e.statusCode == -1){
        noInternet = true;
      }
      update();
    });
  }

  closeOrder(){
    apiClient.getAPI(ApiProvider.closeOrder).then((value) => {
      if(value.statusCode == -1){
        noInternet = true,
        update(),
      }else{

      }
    },onError: (e){
      if(e.statusCode == -1){
        noInternet = true;
      }
      update();
    });
  }
}
