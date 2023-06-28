import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/routes.dart';
import '../../repository/sign_up_repo.dart';
import '../../utils/email_validator.dart';
import '../../utils/regex.dart';
import '../widget/toast.dart';

class SignUpLogic extends GetxController {
  final SignUpRepo signUpRepo;
  SignUpLogic({required this.signUpRepo});

  var obscureText = true.obs;
  void toggle() {
    obscureText.value = !obscureText.value;
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var signUpProcess = false.obs;
  signUp({ required BuildContext context }) async{
    if(!validateLoginData()) return;
    signUpProcess.value = true;
    signUpRepo.signUp({
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text
    }).then((value) => {
      signUpProcess.value = false,
      if(int.tryParse(value.body['res_code']) == 001){
        /// {res_code: 001, status: ok, response: send otp on your mail, otp: 647687}
        /// go to verification page
        Get.toNamed(rsVerificationPage,
            arguments: {  'email' : emailController.text, 'otp' : value.body['otp'] , "expire_time": value.body["expire_time"]}
        ),
      }else if(!value.body['status']){
         Toast.short(toastMessage: "${value.body['response']}",isError: true),
      }else{
        Toast.short(title: "something went wrong", toastMessage: "Sign-Up Failed",isError: true)
      },
      signUpProcess.value = false,
    }).catchError((e){
      signUpProcess.value = false;
      Toast.short(title: "something went wrong", toastMessage: "Sign-Up Failed",isError: true);
    });
  }

  validateLoginData(){
    if(emailController.text.isNotEmpty)
      if(EmailValidator.validate(emailController.text))
        if(passwordController.text.isNotEmpty)
          if(passwordRegex.hasMatch(passwordController.text))
            return true;
          else
            Toast.long(title: "Password must be at least",toastMessage: "8 characters long and contain at least one letter, one number, and one special character.",isError: true);
        else
          Toast.short(toastMessage: "Enter password",isError: true);
      else
        Toast.short(toastMessage: "Enter valid email",iconData: Icons.email,isError: true);
    else
      Toast.short(toastMessage: "Enter your email",iconData: Icons.email,isError: true);
    return false;




  }
}
