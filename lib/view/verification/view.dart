import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nursery_driver/view/widget/otp_view.dart';

import '../../core/routes.dart';
import '../../theme/app_colors.dart';
import '../widget/common_material_button.dart';
import '../widget/input_field/common_input_field.dart';
import 'logic.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);

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
            child: GetBuilder<VerificationLogic>(builder: (logic) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  70.verticalSpace,

                  Image.asset("assets/images/login_image.jpg", width: MediaQuery
                      .of(context)
                      .size
                      .width / 2,),

                  const SizedBox(height: 50,),

                  Row(
                    children: const [
                      Text("Verify Email Address",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold
                        ),),
                    ],
                  ),

                  5.verticalSpace,

                  if(logic.argumentData?['email'] != null)
                    Row(
                      children: [
                        Flexible(
                          child: Text("We sent OTP on your email ID ${logic.argumentData?['email']}",
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300
                            ),),
                        ),
                      ],
                    ),

                  50.verticalSpace,

                  OtpView(
                    key: logic.otpKey,
                    otpCallBack: (s){
                      logic.otpString = s;
                    },
                  ),

                  /// END
                  Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                        if(logic.time.value > 0)
                          Text(logic.getTime(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold
                            ),),

                        TextButton(onPressed: (logic.resentOtpProgress.value ||
                            logic.time.value > 0)
                            ? null
                            : () {

                          logic.resentOtp();
                        }, child: const Text("Resend OTP")),

                        if(logic.resentOtpProgress.value)
                          const SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(strokeWidth: 2,),
                          ),
                      ],
                    );
                  }),

                  50.verticalSpace,


                  CommonMaterialButton(text: "Verify-OTP",
                      color: AppColors.primaryColor(),
                      borderRadius: 5,
                      fontColor: AppColors.whiteColor(),
                      isLoading: logic.verifyProcess.value,
                      onTap: () {
                        logic.verifyEmail(context);
                      }),

                  const SizedBox(height: 20,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Go to login",
                        style: TextStyle(
                            fontWeight: FontWeight.w500
                        ),),

                      TextButton(onPressed: () {
                        Get.offNamed(rsLoginPage);
                      }, child: const Text("Login"))
                    ],
                  ),

                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
