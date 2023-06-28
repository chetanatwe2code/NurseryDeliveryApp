import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../theme/app_colors.dart';

class ProfileMenuItem extends StatelessWidget {
  final String? title;
  final Function() onClick;
  final IconData? icon;
  final Widget? rightWidget;
  final bool isLast;
  final bool isWarning;

  const ProfileMenuItem({
    Key? key,
    this.title,
    required this.onClick,
    this.icon,
    this.rightWidget,
    this.isLast = false,
    this.isWarning = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onClick,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: AppColors.iconColor(),
                        shape: BoxShape.circle
                      ),
                      child: Icon(
                        icon,
                        size: 15.r,
                        color: isWarning
                            ? AppColors.redColor()
                            : AppColors.whiteColor(),
                      ),
                    ),
                    20.horizontalSpace,
                    Text(
                      '$title',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.4,
                        color: isWarning
                            ? AppColors.redColor()
                            : AppColors.textColor(),
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
                if (rightWidget != null) rightWidget!
              ],
            ),
            20.verticalSpace,
            if (!isLast)
              Divider(
                height: 1.r,
                thickness: 1.r,
                color: AppColors.grayColor().withOpacity(0.3),
              ),
          ],
        ),
      ),
    );
  }
}
