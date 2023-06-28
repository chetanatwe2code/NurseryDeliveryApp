import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nursery_driver/core/di/api_provider.dart';
import 'package:nursery_driver/view/widget/toast.dart';

import '../../core/di/api_client.dart';
import '../../utils/regex.dart';

extension HexColor on Color {
  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class AddVehicleLogic extends GetxController {
  final ApiClient apiClient;
  AddVehicleLogic({required this.apiClient});

  final TextEditingController ownerNameController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController modelController = TextEditingController();
  final TextEditingController vehicleNumberController = TextEditingController();
  final TextEditingController chassisNumberController = TextEditingController();

  // create some values
  Color pickerColor =  const Color(0xff000000);
  var currentColor = const Color(0xff000000).obs;

  void changeColor(Color color) {
    pickerColor = color;
  }

  void changeCurrentColor() {
    currentColor.value = pickerColor;
  }

  bool saveProcess = false;
  save(){
    if(!isValidate()) return;
    saveProcess = true;
    update();
    apiClient.postAPI(ApiProvider.registerVehicle, {
      "company_name":brandController.text,
      "model": modelController.text,
      "color": currentColor.value.toHex(),
      "registration_no_of_vehicle":vehicleNumberController.text,
      "chassis_number":chassisNumberController.text,
      "vehicle_owner_name": ownerNameController.text
    }).then((value) => {
      if(value.body['status'] == true){
        Get.back(),
        Toast.short(title: "Vehicle added",toastMessage: value.body['message'] ?? "Vehicle added successfully"),
      }else{
        Toast.short(title: "Failed",toastMessage: value.body['message'] ?? "something went wrong"),
      },
      saveProcess = false,
      update(),
    },onError: (e){
      saveProcess = false;
      update();
    }).catchError((e){
      saveProcess = false;
      update();
    });
  }

  isValidate(){
    if(ownerNameController.text.isNotEmpty)
    if(alphabetRegex.hasMatch(ownerNameController.text))
      if(brandController.text.isNotEmpty)
      if(alphabetRegex.hasMatch(brandController.text))
        if(modelController.text.isNotEmpty)
          if(pickerColor != null)
            if(vehicleNumberController.text.isNotEmpty)
                return true;
            else
              Toast.short(toastMessage: "Enter Vehicle Number",isError: true);
          else
            Toast.short(toastMessage: "Invalid Color",isError: true);
        else
          Toast.short(toastMessage: "Enter Model Name",isError: true);
      else
        Toast.short(toastMessage: "Invalid Brand Name",isError: true);
      else
        Toast.short(toastMessage: "Enter Brand Name",isError: true);
    else
      Toast.short(toastMessage: "Invalid valid Owner Name",isError: true);
    else
      Toast.short(toastMessage: "Enter Owner Name",isError: true);

    return false;
  }


}
