import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

class CommonMaterialButton extends StatelessWidget {
  final int? height;
  final Color? color;
  final String? text;
  final Widget? label;
  final IconData? iconData;
  final int? horizontalPadding;
  final bool isLoading;
  final Function()? onTap;
  final int? fontSize;
  final int? borderRadius;
  final Color? fontColor;
  final FontWeight? fontWeight;

  const CommonMaterialButton({
    Key? key,
    this.height,
    this.color,
    this.text,
    this.label,
    this.iconData,
    this.horizontalPadding,
    this.isLoading = false,
    this.onTap,
    this.fontSize,
    this.borderRadius,
    this.fontColor,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular((borderRadius ?? 45).r),
      color: color ?? AppColors.primaryColor(),
      child: InkWell(
        borderRadius: BorderRadius.circular((borderRadius ?? 45).r),
        onTap: onTap,
        child: Container(
          height: (height ?? 40).r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular((borderRadius ?? 45).r),
          ),
          padding: REdgeInsets.symmetric(
            horizontal: (horizontalPadding ?? 0).toDouble(),
          ),
          child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  if(isLoading)...[
                    SizedBox(
                      height: (height ?? 40) / 2,
                      width: (height ?? 40) / 2,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3.r,
                      ),
                    )
                  ]else...[
                    if(label != null)...[
                       label!
                    ]else...[
                      if(iconData != null)
                        Padding(
                          padding: EdgeInsets.only(right: 5.r),
                          child: Icon(iconData!,size: 20,color: fontColor ?? AppColors.whiteColor()),
                        ),
                      5.horizontalSpace,
                      Text(
                        text ?? "Add/Update",
                        style: TextStyle(
                          color: fontColor ?? Colors.white,
                          fontSize: (fontSize ?? 14).sp,
                          letterSpacing: -0.4,
                          fontWeight: fontWeight ?? FontWeight.w400,
                        ),
                      ),
                    ],
                  ],
                ],
              ),
        ),
      ),
    );
  }
}
