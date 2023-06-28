import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/routes.dart';
import '../../repository/verification_repo.dart';
import '../widget/otp_view.dart';
import '../widget/toast.dart';

class VerificationLogic extends GetxController {
  final VerificationRepo verificationRepo;
  VerificationLogic({required this.verificationRepo});

  dynamic argumentData = Get.arguments;

  final TextEditingController emailController = TextEditingController();
  List<int> otpString = [];

  GlobalKey<OtpViewState> otpKey = GlobalKey<OtpViewState>();

  /// 0 = from sign-up, 1 = forgot password
  int verifyType = 0;

  var time = 0.obs;
  getTime(){
    if(time.value < 10){
      return "00:0${time.value}";
    }
    return "00:${time.value}";
  }

  @override
  void onInit() {
    time.value = int.parse("${argumentData?['expire_time']??59}");
    emailController.text = argumentData?['email']??"";
    verifyType = int.tryParse((argumentData?['verify_type'] ?? 0).toString())??0;
    super.onInit();
    update();
    startTimer();
  }

  var resentOtpProgress = false.obs;
  resentOtp(){
    resentOtpProgress.value = true;
    otpString = [];
    otpKey.currentState?.refreshData();
    update();
    verificationRepo.resentOtp({"email": emailController.text},verifyType==1).then((value) => {
      resentOtpProgress.value = false,
      if(value.body['status']){
        //value.body['otp'],
        time.value = int.parse("${value.body['expire_time']??59}"),
        Toast.long(title: "Successfully sent",toastMessage: "OTP sent Successfully"),
        startTimer(),
      }else{
        Toast.short(toastMessage: "Something went wrong",isError: true),
      },

      resentOtpProgress.value = false,
      update(),
    }).catchError((e){
      resentOtpProgress.value = false;
      Toast.short(toastMessage: "Something went wrong",isError: true);
    });
  }

  Timer? _timer;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec,
          (Timer timer) {
        if (time.value == 0) {
          timer.cancel();
        } else {
          time.value--;
        }
      },
    );
  }

  String getOtp(){
    String otp = "";
    for(int h =  0 ; h < otpString.length ; h ++ ){
      if(otpString[h] != -1){
        otp = otp + otpString[h].toString();
      }
    }
    return otp;
  }

  //
  var verifyProcess = false.obs;
  verifyEmail(BuildContext context) async{
    if(!validateLoginData()) return;
    verifyProcess.value = true;
    verificationRepo.verify({ 'email' : emailController.text, 'otp' : getOtp() }).then((value) => {
      if((value.body['status'] ?? false) || (value.body['success'] ?? false)){
        if(verifyType==1){
          Get.offNamed(rsChangePasswordPage,arguments: { 'token' : value.body['token'] , 'is_forgot' : 1 })
        }else{
          verificationRepo.saveLoginData(value.body['token']),
          Get.offAllNamed(rsBasePage)
        }
      }else{
        Toast.short(toastMessage: "OTP mismatched",isError: true),
      },
      verifyProcess.value = false,
      update()
    }).catchError((e){
      verifyProcess.value = false;
      Toast.short(toastMessage: "Verification Failed",isError: true);
    });
  }

  validateLoginData(){
      if(!otpString.contains(-1)) {
        if(otpString.isEmpty){
          Toast.short(toastMessage: "Enter one time OTP",isError: true);
          return false;
        }
        return true;
      } else {
        Toast.short(toastMessage: "Enter valid OTP",isError: true);
        return false;
      }
  }
}
