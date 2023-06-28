import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nursery_driver/core/di/api_client.dart';
import 'package:nursery_driver/core/di/api_provider.dart';
import 'package:nursery_driver/view/widget/toast.dart';

import '../../utils/regex.dart';
import '../map/logic.dart';
import '../map/view.dart';

class AddWorkingAreaLogic extends GetxController  {
  final ApiClient apiClient;
  AddWorkingAreaLogic({required this.apiClient});

  final TextEditingController cityController = TextEditingController();
  final TextEditingController areaNameController = TextEditingController();
  final TextEditingController pinCodeController = TextEditingController();

  double? latitude;
  double? longitude;
  callback(AddressModel? address){
    cityController.text = address?.city??"";
    areaNameController.text = address?.address??"";
    pinCodeController.text = address?.pinCode??"";
    latitude=address?.latitude;
    longitude=address?.longitude;
    update();
  }

  bool saveProcess = false;
  save(){
    if(!isValidate()) return;
    saveProcess = true;
    update();
    dynamic body = {
      "city":cityController.text,
      "area_name":areaNameController.text,
      "pin_code":pinCodeController.text,
      "driver_lat":latitude??"",
      "driver_log":longitude??""
    };
    apiClient.postAPI(ApiProvider.addWorkingArea,body).then((value) => {
      saveProcess = false,
      if(value.body['status'] == true){
        Get.back(),
        Toast.short(toastMessage: "Location successfully added",iconData: Icons.check_circle),
      }else{
        Toast.short(title: "Failed",toastMessage: "Something wrong",isError: true)
      },
      update()
    },onError: (e){
      saveProcess = false;
      update();
      Toast.short(title: "Failed",toastMessage: "Something wrong",isError: true);
    }).catchError((e){
      saveProcess = false;
      update();
      Toast.short(title: "Failed",toastMessage: "Something wrong",isError: true);
    });
  }

  isValidate(){
    if(cityController.text.isNotEmpty)
      if(alphabetRegex.hasMatch(cityController.text))
        if(areaNameController.text.isNotEmpty)
        if(alphaNumericRegex.hasMatch(areaNameController.text))
          if(pinCodeController.text.isNotEmpty)
          if(numberRegex.hasMatch(pinCodeController.text))
            return true;
          else
            Toast.short(toastMessage: "Enter valid pin-code",isError: true);
          else
            Toast.short(toastMessage: "Enter pin-code",isError: true);
        else
          Toast.short(toastMessage: "Enter valid Area Name",isError: true);
        else
          Toast.short(toastMessage: "Enter Area Name",isError: true);
      else
        Toast.short(toastMessage: "Enter valid City Name",isError: true);
    else
      Toast.short(toastMessage: "Enter City Name",isError: true);

    return false;
  }

}
