import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/routes.dart';
import '../../repository/forgot_password_repo.dart';
import '../../utils/email_validator.dart';
import '../widget/toast.dart';

class ForgotPasswordLogic extends GetxController {
  final ForgotPasswordRepo forgotPasswordRepo;
  ForgotPasswordLogic({required this.forgotPasswordRepo});

  final TextEditingController emailController = TextEditingController();

  dynamic argumentData = Get.arguments;

  @override
  void onInit() {
    emailController.text = argumentData?['email']??"";
    super.onInit();
  }

  var apiProcess = false.obs;
  forgotPassword({ required BuildContext context }) async{
    if(kDebugMode || kProfileMode){
      emailController.text = "chetan.barod.we2code@gmail.com";
    }
    if(!validateLoginData()) return;
    apiProcess.value = true;
    forgotPasswordRepo.forgotPassword({
      "email": emailController.text
    }).then((value) => {
      apiProcess.value = false,
      print("IS_FORGOT_DATA ${value.body}"),
      if(value.body['status']){

        Get.toNamed(rsVerificationPage,
            arguments: {  'email' : emailController.text, 'otp' : value.body['otp'] ,"expire_time": value.body["expire_time"], "verify_type" : 1 }
        ),
      }else{
        Toast.short(toastMessage: "Something went wrong",isError: true)
      },

      apiProcess.value = false,
      update(),
    }).catchError((e){
      apiProcess.value = false;
      Toast.short(toastMessage: "Something went wrong",isError: true);
    });
  }

  validateLoginData(){
    if(emailController.text.isNotEmpty)
      if(EmailValidator.validate(emailController.text))
        return true;
      else
        Toast.short(toastMessage: "Enter valid email",iconData: Icons.email,isError: true);
    else
      Toast.short(toastMessage: "Enter your email",iconData: Icons.email,isError: true);
    return false;
  }
}
