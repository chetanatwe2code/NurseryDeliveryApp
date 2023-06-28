import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/routes.dart';
import '../../theme/app_colors.dart';
import '../widget/common_material_button.dart';
import '../widget/input_field/common_input_field.dart';
import 'logic.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordLogic> {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColor(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: AppColors.whiteColor(),
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                70.verticalSpace,

                Image.asset("assets/images/delivery_logo.jpg", width: MediaQuery
                    .of(context)
                    .size
                    .width / 2,),

                40.verticalSpace,

                Row(
                  children: const [
                    Flexible(
                      child: Text("Forgot Your Password",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        ),),
                    ),
                  ],
                ),

                const SizedBox(height: 5,),

                Row(
                  children: const [
                    Flexible(
                      child: Text("Don`t worry just verify your email and got a passwords",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300
                        ),),
                    ),
                  ],
                ),

                40.verticalSpace,

                CommonInputField(
                  hintText: 'Enter email',
                  labelText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  textController: controller.emailController,
                  suffixIcon: const Icon(Icons.email),
                ),

                10.verticalSpace,

                const SizedBox(height: 25,),


                Obx(() {
                  return CommonMaterialButton(text: "Get OTP",
                      color: AppColors.primaryColor(),
                      borderRadius: 5,
                      fontColor: AppColors.whiteColor(),
                      isLoading: controller.apiProcess.value,
                      onTap: () {
                        controller.forgotPassword(context: context);
                      });
                }),

                40.verticalSpace,

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have remembered",
                      style: TextStyle(
                          fontWeight: FontWeight.w500
                      ),),

                    TextButton(onPressed: () {
                      Get.offNamed(rsLoginPage);
                    }, child: const Text("Login"))
                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
