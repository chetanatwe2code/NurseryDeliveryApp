import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/home_logic.dart';
import '../../theme/app_colors.dart';
import '../widget/otp_view.dart';
import 'logic.dart';

class DeliverCompletedPage extends GetView<DeliverCompletedLogic> {
  final int orderID;
  final String? price;
  const DeliverCompletedPage({Key? key,required this.orderID,this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        padding: EdgeInsets.all(30.r),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Receive \u{20b9}$price from customer and verify the OTP',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AppColors.textColor(),
                  fontSize: 17
              ),),

            OtpView(
              otpCallBack: (s){
                controller.otpString = s;
              },
            ),

            Obx(() {
              return InkWell(
                onTap: controller.verifyProcess.value ? null: () {
                  controller.completeOrder(orderID: orderID,callBack: (){
                    Get.find<HomeLogic>().getOrderList();
                    Get.back();
                    Navigator.pop(context);
                  });
                },
                child:
                Container(
                    height: 50,
                    color: AppColors.primaryColor(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        if(controller.verifyProcess.value)...[
                          SizedBox(
                            height: (40) / 2,
                            width: (40) / 2,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3.r,
                            ),
                          ),
                        ]else...[
                          Text("Complete the order",
                            style: TextStyle(
                                color: AppColors.whiteColor(),
                                fontSize: 20
                            ),),
                          10.horizontalSpace,
                          Container(
                              height: 22,
                              width: 22,
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor(),
                                  shape: BoxShape.circle
                              ),
                              child: Icon(
                                Icons.check, color: AppColors.iconColor(),
                                size: 15,)),
                        ],
                      ],
                      ////             ),
                    )),
              );
            }),

          ],
        )
    );
  }
}
