import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nursery_driver/controller/home_logic.dart';
import 'package:nursery_driver/core/routes.dart';
import 'package:nursery_driver/model/OrderModel.dart';
import 'package:nursery_driver/theme/app_colors.dart';
import 'package:nursery_driver/utils/string_helper.dart';

import '../../../utils/map_utils.dart';


String getDateTime(String dateTime){
  try{
    var date = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(dateTime);
    var timeTime =  DateFormat('MMM d, y').format(date);
    return timeTime.toString();
  }catch (e){
    return dateTime;
  }
}

class OrderWidget extends StatelessWidget {
  final OrderModel? orderModel;
  const OrderWidget({Key? key,this.orderModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderStatusModel orderStatusModel = StringHelper.getStatusModel(orderModel?.orderStatus??"");
    return InkWell(
      onTap: (){
        Get.toNamed(rsOrderDetailsPage,arguments: { "orderModel" : orderModel?.toJson() });
      },
      child: Card(
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
                          Text("Order Date: ",
                            style: TextStyle(
                                color: AppColors.textColor().withOpacity(0.4),
                                fontSize: 11

                            ),),
                          Text(getDateTime(orderModel?.orderDate??""),
                            style: TextStyle(
                                color: AppColors.textColor(),
                                fontSize: 11

                            ),),
                        ],
                      ),
                      3.verticalSpace,
                      Row(
                        children: [
                          Text("Assigned Date: ",
                            style: TextStyle(
                                color: AppColors.textColor().withOpacity(0.4),
                                fontSize: 11

                            ),),
                          Text(getDateTime(orderModel?.orderAsignDate??""),
                            style: TextStyle(
                                color: AppColors.textColor(),
                                fontSize: 11

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
                      Icon(Icons.person,size: 18,color: AppColors.textColor()),
                      5.horizontalSpace,
                      Text(orderModel?.userName??"",
                        style: TextStyle(
                            color: AppColors.textColor(),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),

                  if((orderModel?.orderStatus == OrderStatueData.ready_to_pickup.name)
                      || (orderModel?.orderStatus == OrderStatueData.Pickup.name)
                  )
                  InkWell(
                    onTap: (){
                      UriLaunchUtils.call(orderModel?.phoneNo);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.r,vertical: 2.r),
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor(),
                          border: Border.all(color: AppColors.darkPrimary,width: 0.1),
                          borderRadius: const BorderRadius.all(Radius.circular(5))
                      ),
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Icon(Icons.phone,size: 12,color: AppColors.whiteColor()),
                          5.horizontalSpace,
                          Text(orderModel?.phoneNo??"",
                            style: TextStyle(
                                color: AppColors.whiteColor(),
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w300
                            ),
                          ),


                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_on,size: 18,color: AppColors.textColor()),
                  5.horizontalSpace,
                  Flexible(
                    child: Text(orderModel?.address??"",
                      style: TextStyle(
                        color: AppColors.textColor(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              if((orderModel?.orderStatus == OrderStatueData.Delivered.name)
              || (orderModel?.orderStatus == OrderStatueData.Rejected_by_customer.name)
              || (orderModel?.orderStatus == OrderStatueData.Failed_Delivery_Attempts.name)
              )...[
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
                        Text(orderStatusModel.title,
                          style: TextStyle(
                              color: AppColors.primaryColor(),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]else...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          UriLaunchUtils.openMap(orderModel?.deliveryLat,orderModel?.deliveryLog);
                        },
                        child: Container(
                          height: 35,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.darkPrimary,width: 0.3),
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            color: AppColors.whiteColor(),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.darkPrimary.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(1, 2), // Shadow position
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.directions,color: AppColors.darkPrimary,size: 18,),
                              const SizedBox(width: 5),
                              Text("Get Directions",
                                style: TextStyle(
                                    color: AppColors.textColor()
                                ),),

                            ],
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Get.toNamed(rsOrderDetailsPage,arguments: { "orderModel" : orderModel?.toJson() });
                        },
                        child: Container(
                          height: 35,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.darkPrimary,width: 0.3),
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            color: AppColors.whiteColor(),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.darkPrimary.withOpacity(0.1),
                                blurRadius: 4,
                                offset: const Offset(1, 2), // Shadow position
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.edit,color: AppColors.darkPrimary,size: 18,),
                              const SizedBox(width: 5),
                              Text("Update Status",
                                style: TextStyle(
                                    color: AppColors.textColor()
                                ),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],

            ],
          ),
        ),
      ),
    );
  }

}

