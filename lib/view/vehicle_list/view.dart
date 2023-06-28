import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import '../widget/api_error/no_internet.dart';
import '../widget/api_error/not_found.dart';
import '../widget/common_image.dart';
import 'logic.dart';

class VehicleListPage extends StatelessWidget {
  const VehicleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<VehicleListLogic>().getVehicleList();
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(title: const Text("Vehicles"),),
        body: GetBuilder<VehicleListLogic>(
          assignId: true,
          builder: (logic) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                if(logic.noInternet)...[
                  SizedBox(height: MediaQuery.of(context).size.height / 3,),
                  NoInternet(
                    retry: (){
                      logic.pullRefresh();
                    },
                  ),
                ]else...[
                  if(logic.getProcess)...[
                    SizedBox(height: Get.height/3,),
                    const Center(child: SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(strokeWidth: 2,))),
                    15.verticalSpace,
                    Center(child: Text("Wait..",
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.textColor()
                    ),))
                  ]else...[
                    if(logic.list.isEmpty)...[
                      SizedBox(height: Get.height/3,),
                      const NotFound(),
                    ]else...[
                      Flexible(
                        child: ListView.builder(
                          itemCount: logic.list.length,
                          padding: EdgeInsets.only(top: 25.r, left: 15.r, right: 15.r),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: AppColors.whiteColor(),
                                borderRadius: const BorderRadius.all(Radius.circular(5)),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primaryColor().withOpacity(0.1),
                                    blurRadius: 4,
                                    offset: const Offset(1, 2), // Shadow position
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(10.r),
                              margin: EdgeInsets.only(bottom: 10.r),
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
                                    child: const CommonImage(
                                      imageUrl: "",
                                      assetPlaceholder: "assets/images/delivery_vehicle.jpg",
                                      width: 40,
                                      height: 40,
                                      radius: 30,
                                    ),
                                  ),
                                  15.horizontalSpace,
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${logic.list[index].model}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 15.sp,
                                          letterSpacing: -1,
                                          color: AppColors.textColor(),
                                        ),
                                      ),
                                      5.verticalSpace,
                                      Text(
                                        "${logic.list[index].companyName}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13.sp,
                                          color: AppColors.textColor(),
                                          letterSpacing: -0.4,
                                        ),
                                      ),

                                      5.verticalSpace,
                                      Row(
                                        children: [
                                          Text("${logic.list[index].registrationNoOfVehicle}",
                                            style: TextStyle(
                                              color: AppColors.textColor(),
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },),
                      ),
                    ]
                  ],

                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
