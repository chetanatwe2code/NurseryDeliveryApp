import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/home_logic.dart';
import '../../theme/app_colors.dart';
import '../deliver_completed/logic.dart';
import 'input_field/common_input_field.dart';

class CloseOrder extends GetView<DeliverCompletedLogic> {
  final int? orderID;
  const CloseOrder({Key? key,this.orderID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      padding: EdgeInsets.all(20.r),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.delivery_dining,color: AppColors.iconColor(),),
              5.horizontalSpace,
              Text("Close your order",
              style: TextStyle(
                color: AppColors.textColor(),
                fontWeight: FontWeight.bold
              ),),
            ],
          ),

          15.verticalSpace,
          CommonInputField(
            hintText: 'Enter Reason',
            maxLength: 15,
            maxLine: 7,
            textController: controller.reasonController,
            keyboardType: TextInputType.name,
          ),

          30.verticalSpace,

          Obx(() {
            return InkWell(
              onTap: controller.verifyProcess.value ? null: () {
                controller.closeOrder(orderID: orderID??0,callBack: (){
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

                      if(controller.closeProcess.value)...[
                        SizedBox(
                          height: (40) / 2,
                          width: (40) / 2,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3.r,
                          ),
                        ),
                      ]else...[
                        Text("Close the order",
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
                              Icons.clear, color: AppColors.iconColor(),
                              size: 15,)),
                      ],
                    ],
                    ////             ),
                  )),
            );
          }),

        ],
      ),
    );
  }
}
