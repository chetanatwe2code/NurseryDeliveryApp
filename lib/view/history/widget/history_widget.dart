import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../model/OrderModel.dart';
import '../../../theme/app_colors.dart';
import '../../home/widget/order_widget.dart';

class HistoryWidget extends StatelessWidget {
  final OrderModel? orderModel;
  const HistoryWidget({Key? key,this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shadowColor: AppColors.primaryColor().withOpacity(0.2),
      elevation: 7,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "Order: ",
                      style: TextStyle(
                        color: AppColors.textColor(),
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      ' #${orderModel?.orderId??""}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor(),
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Delivered Date: ",
                          style: TextStyle(
                              color: AppColors.textColor().withOpacity(0.4),
                              fontSize: 10

                          ),),
                        Text(getDateTime(orderModel?.deliveryDate??""),
                          style: TextStyle(
                              color: AppColors.textColor(),
                              fontSize: 10

                          ),),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    // Container(
                    //     height: 24,
                    //     width: 24,
                    //     decoration: BoxDecoration(
                    //         color: AppColors.primaryColor(),
                    //         shape: BoxShape.circle
                    //     ),
                    //     child: Icon(Icons.person_outline,size: 18,color: AppColors.whiteColor())),
                    // 5.horizontalSpace,
                    Text('${orderModel?.driverName}',
                      style: TextStyle(
                          color: AppColors.textColor(),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Container(
                //     height: 24,
                //     width: 24,
                //     decoration: BoxDecoration(
                //         color: AppColors.primaryColor(),
                //         shape: BoxShape.circle
                //     ),
                //     child: Icon(Icons.pin_drop_outlined,size: 18,color: AppColors.whiteColor())),
                // 5.horizontalSpace,
                Flexible(
                  child: Text('${orderModel?.address}',
                    style: TextStyle(
                      color: AppColors.textColor(),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Order Status:",
                  style: TextStyle(
                    color: AppColors.textColor(),
                  ),),
                Row(
                  children: [
                    Container(
                      height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor(),
                          shape: BoxShape.circle
                        ),
                        child: Icon(Icons.delivery_dining_outlined,size: 15,color: AppColors.whiteColor())),
                    5.horizontalSpace,
                    Text('Completed',
                      style: TextStyle(
                          color: AppColors.primaryColor(),
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ],
            ),


          ],
        ),
      ),
    );
  }
}
