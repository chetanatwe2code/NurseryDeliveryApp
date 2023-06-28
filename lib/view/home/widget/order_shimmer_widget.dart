import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../theme/app_colors.dart';

class OrderShimmerWidget extends StatelessWidget {
  const OrderShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: AppColors.shimmerBaseColor(),
          highlightColor: AppColors.shimmerHighlightColor(),
          enabled: true,
          child: Card(
            margin: const EdgeInsets.only(bottom: 10),
            shadowColor: AppColors.primaryColor().withOpacity(0.2),
            elevation: 7,
            color: AppColors.shimmerBaseColor(),
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
                            ' ######',
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
                              Text("--/--/----",
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
                              Text("--/--/----",
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
                          Text("----",
                            style: TextStyle(
                                color: AppColors.textColor(),
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      Container(
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
                            Text("0000000000",
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
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.location_on,size: 18,color: AppColors.textColor()),
                      5.horizontalSpace,
                      Flexible(
                        child: Text("---- --- ----,------- ---",
                          style: TextStyle(
                            color: AppColors.textColor(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
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

                      const SizedBox(width: 15),
                      Expanded(
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },);
  }
}
