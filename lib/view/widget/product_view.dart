import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nursery_driver/model/ProductModel.dart';
import 'package:nursery_driver/utils/string_helper.dart';

import '../../theme/app_colors.dart';
import 'common_image.dart';

class ProductView extends StatelessWidget {
  final ProductModel? productModel;
  const ProductView({Key? key,this.productModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              imageUrl: StringHelper.fistValueOfCommaSeparated(value: productModel?.allImagesUrl),
              assetPlaceholder: "assets/images/default_user.jpg",
              width: 40,
              height: 40,
              radius: 30,
            ),
          ),
          15.horizontalSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${productModel?.name}",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15.sp,
                  letterSpacing: -1,
                  color: AppColors.textColor(),
                ),
              ),
              5.verticalSpace,
              if(productModel?.brand?.isNotEmpty??false)
                Text(
                  "${productModel?.brand}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.sp,
                    color: AppColors.textColor(),
                    letterSpacing: -0.4,
                  ),
                ),
              // Row(
              //   children: [
              //     Text(
              //       "Quantity ×",
              //       style: TextStyle(
              //         fontWeight: FontWeight.w400,
              //         fontSize: 13.sp,
              //         color: AppColors.textColor(),
              //         letterSpacing: -0.4,
              //       ),
              //     ),
              //     1.horizontalSpace,
              //     Text(
              //       "\u{20B9}price",
              //       style: TextStyle(
              //         fontWeight: FontWeight.w400,
              //         fontSize: 13.sp,
              //         color: AppColors.textColor(),
              //         letterSpacing: -0.4,
              //       ),
              //     ),
              //   ],
              // ),
              5.verticalSpace,
              if(productModel?.price != null)
              Row(
                children: [
                  Text("\u{20B9}",
                    style: TextStyle(
                        color: AppColors.textColor(),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  5.horizontalSpace,
                  Text("${productModel?.price ?? ""}",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                      color: AppColors.textColor(),
                      letterSpacing: -0.4,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
