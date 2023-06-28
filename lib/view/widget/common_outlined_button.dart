import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';

class CommonOutlinedButton extends StatelessWidget {
  final int? height;
  final Color? color;
  final Color? borderColor;
  final String? text;
  final Widget? label;
  final IconData? iconData;
  final IconData? rightIconData;
  final int? horizontalPadding;
  final bool isLoading;
  final Function()? onTap;
  final int? fontSize;
  final int? borderRadius;
  final Color? fontColor;
  final FontWeight? fontWeight;

  const CommonOutlinedButton({
    Key? key,
    this.height,
    this.color,
    this.text,
    this.label,
    this.iconData,
    this.rightIconData,
    this.horizontalPadding,
    this.isLoading = false,
    this.onTap,
    this.fontSize,
    this.borderRadius,
    this.borderColor,
    this.fontColor,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular((borderRadius ?? 15).r),
      onTap: onTap,
      child: Container(
        height: (height ?? 30).r,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular((borderRadius ?? 15).r),
          border: Border.all(color: borderColor ?? AppColors.primaryColor())
        ),
        padding: REdgeInsets.symmetric(
          horizontal: (horizontalPadding ?? 10).toDouble(),
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
                    child: Icon(iconData!,size: 20,color: fontColor ?? AppColors.primaryColor()),
                  ),
                Text(
                  text ?? "Add/Update",
                  style: TextStyle(
                    color: fontColor ?? AppColors.primaryColor(),
                    fontSize: (fontSize ?? 13).sp,
                    letterSpacing: -0.4,
                    fontWeight: fontWeight ?? FontWeight.w400,
                  ),
                ),

                if(rightIconData != null)
                  Padding(
                    padding: EdgeInsets.only(right: 5.r),
                    child: Icon(rightIconData!,size: 20,color: fontColor ?? AppColors.primaryColor()),
                  ),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
