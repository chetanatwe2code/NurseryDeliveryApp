import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nursery_driver/core/routes.dart';
import 'package:nursery_driver/view/widget/common_material_button.dart';

import '../../theme/app_colors.dart';
import '../widget/input_field/common_input_field.dart';
import '../widget/otp_view.dart';
import 'logic.dart';

class LoginPage extends GetView<LoginLogic> {
  const LoginPage({Key? key}) : super(key: key);

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

                const SizedBox(height: 30,),

                Image.asset("assets/images/delivery_logo.jpg", width: MediaQuery
                    .of(context)
                    .size
                    .width / 3,),

                const SizedBox(height: 30,),

                Row(
                  children: const [
                    Text("Nursery to online delivery app",
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),),
                  ],
                ),

                const SizedBox(height: 5,),

                Row(
                  children: const [
                    Text("Log In Your Account",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300
                      ),),
                  ],
                ),

                const SizedBox(height: 40,),

                const SizedBox(height: 20,),
                CommonInputField(
                  hintText: 'Enter email',
                  labelText: "Email",
                  keyboardType: TextInputType.emailAddress,
                  textController: controller.emailController,
                  suffixIcon: const Icon(Icons.email),
                ),

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

                10.verticalSpace,

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){
                      Get.toNamed(rsForgotPasswordPage,arguments: {"email":controller.emailController.text});
                    }, child: const Text("Forgot Password"))
                  ],
                ),

                const SizedBox(height: 25,),


                Obx(() {
                  return CommonMaterialButton(text: "Login",
                      color: AppColors.primaryColor(),
                      borderRadius: 5,
                      fontColor: AppColors.whiteColor(),
                      isLoading: controller.loginProcess.value,
                      onTap: () {
                        controller.login(context: context);
                      });
                }),

                const SizedBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't Have a Account",
                      style: TextStyle(
                          fontWeight: FontWeight.w500
                      ),),

                    TextButton(onPressed: () {
                      Get.offNamed(rsSignUpPage);
                    }, child: const Text("Sign-up"))
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
