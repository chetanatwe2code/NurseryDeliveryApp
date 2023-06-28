import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nursery_driver/view/widget/toast.dart';

import '../core/di/api_provider.dart';
import '../core/routes.dart';
import '../model/DriverModel.dart';
import '../repository/account_repo.dart';
import '../view/widget/gender_radio_group.dart';

class AccountLogic extends GetxController implements GetxService{
  final AccountRepo accountRepo;
  AccountLogic({required this.accountRepo});


 Future<void> logout() async{
    await accountRepo.apiClient.sharedPreferences.remove(ApiProvider.preferencesToken);
    //await FirebaseMessaging.instance.deleteToken();
    Get.offAllNamed(rsLoginPage);
  }

  DriverModel? driverModel;
  Gender? gender;
  setSender(Gender gender){
    this.gender = gender;
  }
  bool noInternet = false;
  Future<void> getAccountDetails()async {
    noInternet = false;
    update();
  await accountRepo.getAccountDetails().then((value) => {
    if(value.statusCode == -1){
      noInternet = true,
      update(),
    }else{
      print("HELLO_RE ${value.body}"),
      driverModel = DriverModel.fromJson(value.body[0]),
      update()
    },
   },onError: (e){
    if(e.statusCode == -1){
      noInternet = true;
    }
    update();
  });
 }

  pullRefresh() async{
    await getAccountDetails();
  }

  setFCMToken({ required String token }) async {
    accountRepo.updateFCMToken({ "token" : token }).then((value) => {
      print("FCM_UPDATE e ${value.body}")
    },onError: (e){
      print("FCM_UPDATE e $e");
    }).catchError((e){
      print("FCM_UPDATE e1 $e");
    });
  }


  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController aadharController = TextEditingController();
  final TextEditingController licenceNoController = TextEditingController();
  var updateProcess = false.obs;

  String? dateOfBrith;
  initData(){
    firstNameController.text = driverModel?.driverName??"";
    lastNameController.text = driverModel?.driverLastName??"";
    numberController.text = driverModel?.contectNo??"";
    aadharController.text = driverModel?.aadharNo??"";
    licenceNoController.text = driverModel?.licenceNo??"";
    addressController.text = driverModel?.currentAddress??"";
    dateOfBrith = driverModel?.dateOfBirth;
    gender = driverModel?.gender == 'male' ? Gender.male : (driverModel?.gender == 'female' ? Gender.female : null);
  }


  updateDriver({File? file,File? licence,File? aadhar}){
    // licence_no: '212131722',
    // licence_issue_date: '2022/07/12',
    // licence_validity_date: '2024/07/12'
    if(validateLoginData()) return;
    updateProcess.value = true;
    update();
    dynamic body = {
      'image': file != null ? MultipartFile(file, filename: 'user_image.jpg') : "",
      "driver_name":firstNameController.text,
      "driver_last_name":lastNameController.text,
      "contect_no":numberController.text,
      "current_address": addressController.text,
      "gender": gender?.name,
      "aadhar_no": aadharController.text,
      "age": getAge(),
      "date_of_birth": dateOfBrith,
      "licence" : licence != null ? MultipartFile(licence, filename: 'user_licence.jpg') : "",
      "aadhar_card" : aadhar != null ? MultipartFile(aadhar, filename: 'user_aadhar.jpg') : "",
      "licence_no": licenceNoController.text,
      "licence_issue_date": "2024/07/12",
      "licence_validity_date": '2024/07/12',
    };
   Future<Response> res = accountRepo.driverUpdate(FormData(body));
    res.then((value) => {
      print("API_RES ${value.body}"),
      updateProcess.value = false,
      if(value.body['status'] == true){
        Get.back(),
        Toast.long(title: "Updated",toastMessage: "Your profile has been updated",iconData: Icons.check_circle),
        getAccountDetails(),
      }else{
        Toast.short(toastMessage: value.body['message'] ?? "Something went wrong",isError: true),
        updateProcess.value = false,
        update(),
      },
    }).catchError((e){
      updateProcess.value = false;
      Toast.short(toastMessage: "Something went wrong",isError: true);
      update();
    });
 }

  int getAge() {
    if (dateOfBrith == null) return 0;
    try {
      DateTime dateOfBirth = DateTime.parse(dateOfBrith!);
      Duration period = DateTime.now().difference(dateOfBirth);
      int years = period.inDays ~/ 365;
      //int months = (period.inDays % 365) ~/ 30;
      // days = (period.inDays % 365) % 30;
      return years;
    } catch (e) {
      return 0;
    }
  }


  validateLoginData(){
    if(firstNameController.text.isNotEmpty)
        return false;
    else
      Toast.short(toastMessage: "First name cannot be empty",isError: true);

    return true;
  }
}
