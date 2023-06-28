import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import 'logic.dart';

class SplashPage extends GetView<SplashLogic> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.checkLogin();
    return Scaffold(
      backgroundColor: AppColors.whiteColor(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            const SizedBox(),
            const SizedBox(),
            Image.asset("assets/images/delivery_logo.jpg", width: MediaQuery
                .of(context)
                .size
                .width / 2,),
            10.verticalSpace,
            Column(
              children: [
                Text("Delivery Application",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold
                  ),),
                5.verticalSpace,
                Text("From Nursery",
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300
                  ),),
              ],
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
