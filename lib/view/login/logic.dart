import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/routes.dart';
import '../../repository/login_repo.dart';
import '../../utils/email_validator.dart';
import '../widget/toast.dart';

class LoginLogic extends GetxController {
  final LoginRepo loginRepo;
  LoginLogic({required this.loginRepo});

  var obscureText = true.obs;
  void toggle() {
    obscureText.value = !obscureText.value;
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var loginProcess = false.obs;
  login({ required BuildContext context }) async{
    if(kDebugMode || kProfileMode){
       emailController.text = "chetan.barod.we2code@gmail.com";
       passwordController.text = "12345@abcd";
      //emailController.text = "sagar.we2code@gmail.com";
      //passwordController.text = "sagar@we2code";
    }
    if(!validateLoginData()) return;
    loginProcess.value = true;
    loginRepo.login({
      "email": emailController.text,
      "password": passwordController.text
    }).then((value) => {
      loginProcess.value = false,
      if(int.tryParse(value.body['res_code']) == 001){
        loginRepo.saveLoginData(value.body['token']),
        print("LOGIN_TOKEN "+ value.body['token']),
        Get.offAllNamed(rsBasePage,arguments: {"from_login" : 1}),
      }else if(int.tryParse(value.body['res_code']) == 003){
        Toast.long(title: "Credentials Mismatch",toastMessage: "Your login credentials do not match",isError: true),
      }
      else{
          Toast.short(title: "something went wrong",toastMessage: "Try next time",isError: true),
        },
      loginProcess.value = false,
    }).catchError((e){
      loginProcess.value = false;
      Toast.short(title: "something went wrong",toastMessage: "Try next time",isError: true);
    });
  }

  validateLoginData(){
    if(emailController.text.isNotEmpty)
      if(EmailValidator.validate(emailController.text))
        if(passwordController.text.isNotEmpty)
          return true;
        else
          Toast.short(toastMessage: "Enter password",iconData: Icons.lock,isError: true);
      else
        Toast.short(toastMessage: "Enter valid email",iconData: Icons.email,isError: true);
    else
      Toast.short(toastMessage: "Enter your email",iconData: Icons.email,isError: true);
    return false;
  }
}
