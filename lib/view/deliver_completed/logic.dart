import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nursery_driver/core/di/api_provider.dart';
import 'package:nursery_driver/view/widget/toast.dart';

import '../../controller/home_logic.dart';
import '../../core/di/api_client.dart';

class DeliverCompletedLogic extends GetxController implements GetxService {
  final ApiClient apiClient;
  DeliverCompletedLogic({required this.apiClient});

  List<int> otpString = [];
  String getOtp(){
    String otp = "";
    for(int h =  0 ; h < otpString.length ; h ++ ){
      if(otpString[h] != -1){
        otp = otp + otpString[h].toString();
      }
    }
    return otp;
  }

  var verifyProcess = false.obs;
  completeOrder({ required int orderID , Function? callBack }){
    if(!validateLoginData()) return;
    verifyProcess.value = true;
    apiClient.postAPI(ApiProvider.deliveryComplete, {
      "order_id": "$orderID",
      "order_delivery_confirm_code" : getOtp()
    }).then((value) => {
      print("API_DATA___ ${value.body}"),
      if(value.body['status'] == true){
        if(callBack != null){
          callBack(),
        },
        Toast.short(title: "Completed",toastMessage: value.body['message'])
      }else{
        Toast.short(title: "Failed",toastMessage: value.body['message'])
      },
      verifyProcess.value = false
    },onError: (e){
      verifyProcess.value = false;
    }).catchError((onError){
      verifyProcess.value = false;
    });
  }

  final TextEditingController reasonController = TextEditingController();
  var closeProcess = false.obs;
  closeOrder({ required int orderID , Function? callBack }){
    if(reasonController.text.isEmpty){
      Toast.short(title: "Close Order",toastMessage: "Enter Reason");
      return;
    }
    closeProcess.value = true;
    apiClient.putAPI(ApiProvider.deliveryClose, {
      "order_id": "$orderID",
      "order_status": OrderStatueData.Failed_Delivery_Attempts.name,
      "status_comment": reasonController.text
    }).then((value) => {
      print("API_DATA___ ${apiClient.token}"),
      print("API_DATA___ $orderID"),
      print("API_DATA___ ${value.body}"),
      if(value.body['status'] == true){
        if(callBack != null){
          callBack(),
        },
        Toast.short(title: "Closed",toastMessage: value.body['message'])
      }else{
        Toast.short(title: "Failed",toastMessage: value.body['message'])
      },
      closeProcess.value = false
    },onError: (e){
      closeProcess.value = false;
    }).catchError((onError){
      closeProcess.value = false;
    });
  }

  validateLoginData(){
    if(otpString.isNotEmpty && (!otpString.contains(-1))) {
      return true;
    } else {
      Toast.short(title: "Verification Failed",toastMessage: "Enter OTP");
      return false;
    }
  }

}
