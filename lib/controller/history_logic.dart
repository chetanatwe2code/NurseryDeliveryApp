import 'package:get/get.dart';
import 'package:nursery_driver/core/di/api_provider.dart';

import '../core/di/api_client.dart';
import '../model/OrderModel.dart';

class HistoryLogic extends GetxController implements GetxService{
  final ApiClient apiClient;
  HistoryLogic({required this.apiClient});

  List<OrderModel> orderModel = [];

  bool getDataProcess = false;
  bool noInternet = false;
  getHistory(){
    getDataProcess = true;
    noInternet = false;
    orderModel.clear();
    update();
    apiClient.postAPI(ApiProvider.getOrder,{
      "order_status": "delivered"
    }).then((value) => {
      getDataProcess = false,
      if(value.statusCode == -1){
        noInternet = true,
        update(),
      }else{
        if(value.statusCode == 200){
          if (value.body.isNotEmpty){
            value.body.forEach((v){
              orderModel.add(OrderModel.fromJson(v));
            }),
          },
        },
        update(),
      }
    },onError: (e){
      getDataProcess = false;
      if(e.statusCode == -1){
        noInternet = true;
      }
      update();
    });

  }

  pullRefresh() async{
    await getHistory();
  }


}
