import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nursery_driver/theme/app_colors.dart';
import 'package:nursery_driver/view/order_details/logic.dart';
import 'package:nursery_driver/view/widget/product_view.dart';


import '../../controller/home_logic.dart';
import '../../utils/map_utils.dart';
import '../widget/close_order.dart';
import '../widget/common_image.dart';
import '../deliver_completed/view.dart';

class OrderDetailsPage extends GetView<OrderDetailsLogic> {
  const OrderDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getOrderProduct();
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.blueGrey.withOpacity(0.1),
        appBar: AppBar(title: const Text("Order Details")),
        bottomNavigationBar:
          ((controller.orderModel?.orderStatus == OrderStatueData.ready_to_pickup.name)
          || (controller.orderModel?.orderStatus == OrderStatueData.Pickup.name)
       ) ?
        Container(
          height: 50,
          color: AppColors.primary,
          child: InkWell(
            onTap: () {
              Get.bottomSheet(
                DeliverCompletedPage(
                    orderID: controller.orderModel?.orderId ?? 0,
                    price: "${controller.orderModel?.payment ?? 0}"),
                barrierColor: Colors.transparent,
                isDismissible: false,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                enableDrag: false,
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                Text("Delivery Completed",
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
                      Icons.checklist_rtl_sharp, color: AppColors.iconColor(),
                      size: 15,)),
              ],
            ),
          ),
        ) : null,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                20.verticalSpace,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.store_rounded, size: 15,),
                        5.horizontalSpace,
                        Text(
                          "Order: ",
                          style: TextStyle(
                            color: AppColors.textColor(),
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      ' #${controller.orderModel?.orderId}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor(),
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),

                10.verticalSpace,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        const Icon(Icons.receipt_long, size: 15,),
                        5.horizontalSpace,
                        Text(
                          "Order Amount: ",
                          style: TextStyle(
                            color: AppColors.textColor(),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '\u{20B9} ${controller.orderModel?.payment ?? 0}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor(),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                10.verticalSpace,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [
                        const Icon(Icons.receipt_long, size: 15,),
                        5.horizontalSpace,
                        Text(
                          "Order Type: ",
                          style: TextStyle(
                            color: AppColors.textColor(),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${controller.orderModel?.paymentMethod}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor(),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                10.verticalSpace,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.delivery_dining, size: 15,),
                        5.horizontalSpace,
                        Text(
                          "Order Status: ",
                          style: TextStyle(
                            color: AppColors.textColor(),
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${controller.orderModel?.orderStatus}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryColor(),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                20.verticalSpace,

                Divider(
                  height: 1.r,
                  thickness: 1.r,
                  color: AppColors.grayColor().withOpacity(0.3),
                ),

                25.verticalSpace,

                Container(
                  margin: REdgeInsets.only(bottom: 27),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 64.r,
                        height: 64.r,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1.r,
                            color: AppColors.blackColor().withOpacity(0.1),
                          ),
                          borderRadius: BorderRadius.circular(64.r),
                        ),
                        child: CommonImage(
                          imageUrl: "${controller.orderModel?.userImage}",
                          assetPlaceholder: "assets/images/default_user.jpg",
                          width: 60,
                          height: 60,
                          radius: 30,
                        ),
                      ),
                      15.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${controller.orderModel?.userName}",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15.sp,
                              letterSpacing: -1,
                              color: AppColors.textColor(),
                            ),
                          ),
                          2.verticalSpace,
                          Text("${controller.orderModel?.userEmail}",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                              letterSpacing: -1,
                              color: AppColors.textColor(),
                            ),
                          ),
                          5.verticalSpace,
                          InkWell(
                            onTap: () {
                              UriLaunchUtils.call(controller.orderModel?.phoneNo);
                            },
                            child: Row(
                              children: [
                                Icon(Icons.phone, size: 15,
                                  color: AppColors.primaryColor(),),
                                5.horizontalSpace,
                                Text("Call",
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13.sp,
                                    color: AppColors.primaryColor(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                20.verticalSpace,

                if((controller.orderModel?.orderStatus == OrderStatueData.ready_to_pickup.name)
                    || (controller.orderModel?.orderStatus == OrderStatueData.Pickup.name)
                )
                Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                          height: 30,
                          decoration: BoxDecoration(
                            //color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.all(Radius.circular(5.r)),
                              border: Border.all(
                                  color: AppColors.darkPrimary.withOpacity(0.5),
                                  width: 0.2)
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 10.r),
                          child: Row(
                            children: [

                              Text("Order Item ${controller.orderModel
                                  ?.totalOrderProductQuantity}",
                                style: TextStyle(
                                  color: AppColors.textColor(),
                                ),),
                            ],
                          )),
                      InkWell(
                        onTap: () {
                          UriLaunchUtils.openMap(controller.orderModel?.deliveryLat,
                              controller.orderModel?.deliveryLog);
                        },
                        child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.all(Radius.circular(5.r)),
                              border: Border.all(color: AppColors.darkPrimary
                                  .withOpacity(0.3), width: 0.2),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primaryColor().withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(1, 2), // Shadow position
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.r),
                            child: Row(
                              children: [

                                Text("Direction",
                                  style: TextStyle(
                                    color: AppColors.textColor(),
                                  ),),
                                5.horizontalSpace,
                                Icon(Icons.directions, color: AppColors
                                    .primaryColor(), size: 20,),
                              ],
                            )),
                      ),
                      InkWell(
                        onTap: (){
                          Get.bottomSheet(
                            CloseOrder(orderID: controller.orderModel?.orderId),
                            isScrollControlled: true,
                            barrierColor: Colors.transparent,
                            isDismissible: false,
                          );
                        },
                        child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.redColor().withOpacity(0.1),
                              borderRadius: BorderRadius.all(Radius.circular(5.r)),
                              border: Border.all(
                                  color: AppColors.redColor().withOpacity(0.3),
                                  width: 0.2),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.redColor().withOpacity(0.1),
                                  blurRadius: 4,
                                  offset: const Offset(1, 2), // Shadow position
                                ),
                              ],
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 10.r),
                            child: Row(
                              children: [

                                Text("Close Order",
                                  style: TextStyle(
                                    color: AppColors.textColor(),
                                  ),),
                                5.horizontalSpace,
                                Icon(
                                  Icons.delivery_dining, color: AppColors.redColor(),
                                  size: 20,),
                              ],
                            )),
                      ),

                    ],
                  ),
                ),

                GetBuilder<OrderDetailsLogic>(
                  assignId: true,
                  builder: (logic) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text("Order Detail",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                            color: AppColors.textColor(),
                          ),
                        ),

                        15.verticalSpace,

                        ListView.builder(
                          itemCount: logic.pList.length,
                          padding: EdgeInsets.only(top: 15.r, left: 15.r, right: 15.r),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ProductView(productModel: logic.pList[index],);
                          },),
                      ],
                    );
                  },
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
