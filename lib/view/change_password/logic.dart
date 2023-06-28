import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/routes.dart';
import '../../repository/change_password_repo.dart';
import '../../utils/regex.dart';
import '../widget/toast.dart';

class ChangePasswordLogic extends GetxController {
  final ChangePasswordRepo changePasswordRepo;
  ChangePasswordLogic({required this.changePasswordRepo});

  dynamic argumentData = Get.arguments;

  /// is_forgot
  ///  0 = change password , 1 = forgot password
  bool isForgot = false;
  String? token;

  @override
  void onInit() {
    isForgot = (int.tryParse((argumentData?['is_forgot'] ?? 0).toString())??0) == 1;
    if(isForgot){
      token = argumentData?['token'];
    }
    super.onInit();
    update();
  }

  var obscureText = true.obs;
  var obscure2Text = true.obs;
  void toggle() {
    obscureText.value = !obscureText.value;
  }
  void toggle2() {
    obscure2Text.value = !obscure2Text.value;
  }
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  var apiProcess = false.obs;
  changePassword({ required BuildContext context }) async{
    if(!validateLoginData()) return;
    apiProcess.value = true;
    update();
    if(!isForgot){
      token = changePasswordRepo.getToken();
    }
    changePasswordRepo.changePassword({"password": passwordController.text}, token).then((value) => {
      apiProcess.value = false,
      update(),

      if(value.body['success'] == true){
        if(isForgot){
          Toast.short(toastMessage: "Password Changed successfully",iconData: Icons.check_circle),
          Get.offAllNamed(rsLoginPage),
        }else{
          Get.back(),
          Toast.short(toastMessage: "Password Changed successfully",iconData: Icons.check_circle),
        }
      }else{
        Toast.short(toastMessage: "Something wrong",isError: true),
      },
    },onError: (e){
      Toast.short(toastMessage: "Something wrong",isError: true);
      update();
    }).catchError((e){
      apiProcess.value = false;
      Toast.short(toastMessage: "Something wrong",isError: true);
      update();
    });
  }

  validateLoginData(){
    if(passwordController.text.isNotEmpty)
      if(passwordRegex.hasMatch(passwordController.text))
        if(confirmPasswordController.text.isNotEmpty)
          if(confirmPasswordController.text.endsWith(passwordController.text))
            return true;
          else
            Toast.short(toastMessage: "Password and Confirm Password Mismatched",isError: true);
        else
          Toast.short(toastMessage: "Enter Confirm Password",isError: true);
      else
        Toast.short(title: "Password must be at least",toastMessage: "8 characters long and contain at least one letter, one number, and one special character.",isError: true);
    else
      Toast.short(toastMessage: "Enter new Password",isError: true);

    return false;
  }
}
