import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import '../widget/common_material_button.dart';
import '../widget/input_field/common_input_field.dart';
import 'logic.dart';

class ChangePasswordPage extends GetView<ChangePasswordLogic> {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColor(),
      appBar: controller.isForgot ? null : AppBar(title: const Text("Change Password"),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const SizedBox(height: 30,),

                Image.asset("assets/images/login_image.jpg", width: MediaQuery
                    .of(context)
                    .size
                    .width / 2,),

                const SizedBox(height: 30,),

                Row(
                  children: const [
                    Text("To Access your account",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),),
                  ],
                ),

                const SizedBox(height: 5,),

                Row(
                  children: const [
                    Text("Reset your password",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300
                      ),),
                  ],
                ),

                const SizedBox(height: 40,),

                30.verticalSpace,

                Obx(() {
                  return CommonInputField(
                    hintText: 'Enter password',
                    obscureText: controller.obscureText.value,
                    labelText: "Password",
                    keyboardType: TextInputType.text,
                    textController: controller.passwordController,
                    suffixIcon: IconButton(onPressed: controller.toggle,
                        icon: Icon(
                          controller.obscureText.isTrue
                              ? Icons.visibility_off
                              : Icons
                              .visibility,
                        )),
                  );
                }),

                30.verticalSpace,

                Obx(() {
                  return CommonInputField(
                    hintText: 'Confirm Password',
                    obscureText: controller.obscure2Text.value,
                    labelText: "Confirm Password",
                    keyboardType: TextInputType.text,
                    textController: controller.confirmPasswordController,
                    suffixIcon: IconButton(onPressed: controller.toggle2,
                        icon: Icon(
                          controller.obscure2Text.isTrue
                              ? Icons.visibility_off
                              : Icons
                              .visibility,
                        )),
                  );
                }),


                10.verticalSpace,

                const SizedBox(height: 25,),


                Obx(() {
                  return CommonMaterialButton(text: "Reset Password",
                      color: AppColors.primaryColor(),
                      borderRadius: 5,
                      fontColor: AppColors.whiteColor(),
                      isLoading: controller.apiProcess.value,
                      onTap: () {
                        controller.changePassword(context: context);
                      });
                }),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

