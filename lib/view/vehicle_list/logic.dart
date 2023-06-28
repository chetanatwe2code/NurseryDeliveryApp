import 'package:get/get.dart';
import 'package:nursery_driver/core/di/api_client.dart';
import 'package:nursery_driver/core/di/api_provider.dart';
import 'package:nursery_driver/model/VehicleModel.dart';

class VehicleListLogic extends GetxController {
  final ApiClient apiClient;
  VehicleListLogic({required this.apiClient});

  List<VehicleModel> list = [];
  bool getProcess = false;
  bool noInternet = false;

  getVehicleList() async{
    getProcess = true;
    noInternet = false;
    list.cast();
    update();
    
    apiClient.postAPI(ApiProvider.getVehicle, {}).then((value) => {
      getProcess = false,
      update(),
      if(value.statusCode == -1){
        noInternet = true,
        update(),
      },
      if(value.statusCode == 200){
        if (value.body.isNotEmpty){
          value.body.forEach((v){
            list.add(VehicleModel.fromJson(v));
          }),
        },
      },
      update(),
    },onError: (e){
      getProcess = false;
      if(e.statusCode == -1){
        noInternet = true;
      }
      update();
    });
    update();
  }

  pullRefresh() async{
    await getVehicleList();
  }

}
