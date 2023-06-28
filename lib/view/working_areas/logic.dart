import 'package:get/get.dart';
import 'package:nursery_driver/core/di/api_provider.dart';

import '../../core/di/api_client.dart';
import '../../model/AreasModel.dart';

class WorkingAreasLogic extends GetxController implements GetxService {
  final ApiClient apiClient;
  WorkingAreasLogic({required this.apiClient});


  List<AreasModel> list = [];
  bool getAreasProcess = false;
  bool noInternet = false;
  getAreas(){
    noInternet = false;
    getAreasProcess = true;
    list.clear();
    update();
    apiClient.getAPI(ApiProvider.myAreas).then((value) => {
      getAreasProcess = false,
      if(value.statusCode == -1){
        noInternet = true,
        update(),
      }else{
        if(value.statusCode == 200){
          if (value.body.isNotEmpty){
            value.body.forEach((v){
              list.add(AreasModel.fromJson(v));
            }),
          },
        },
        update()
      },
    },onError: (e){
      getAreasProcess = false;
      if(e.statusCode == -1){
        noInternet = true;
      }
      update();
    });

  }


  activeInActiveArea(bool s,int index){
    list[index].isLoading = true;
    update();
    apiClient.putAPI(ApiProvider.activeDeactivateArea, {"id":"${list[index].id}","user_active_this_area": s ? 1 : 0}).then((value) => {
      print("putAPI------------${value.body}"),
      if(value.body['status'] == true){
        list[index].userActiveThisArea = s ? 1 : 0,
      },
      list[index].isLoading = false,
      update()
    },onError: (e){
      list[index].isLoading = false;
      update();
    });
  }

  pullRefresh() async{
    await getAreas();
  }
}
