import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nursery_driver/model/AreasModel.dart';
import 'package:nursery_driver/view/home/widget/order_widget.dart';

import '../../../theme/app_colors.dart';
import '../../widget/custom_switch.dart';

class WorkingArea extends StatelessWidget {
  final AreasModel? areasModel;
  final Function? onChange;
  const WorkingArea({Key? key,this.areasModel,this.onChange}) : super(key: key);

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
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Expanded(
                flex: 8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Status:",
                          style: TextStyle(
                              color: AppColors.textColor(),
                              fontWeight: FontWeight.bold,
                              fontSize: 17
                          ),),

                        10.horizontalSpace,

                        Text(areasModel?.userActiveThisArea == 1 ? "Active" : "In-active",
                          style: TextStyle(
                              color: areasModel?.userActiveThisArea == 1 ? AppColors.primaryColor() : AppColors.redColor(),
                              fontWeight: FontWeight.bold,
                              fontSize: 12
                          ),),
                      ],
                    ),

                    5.verticalSpace,
                    Text(
                      "${areasModel?.areaName}",
                      style: TextStyle(
                          color: AppColors.textColor()
                      ),),
                  ],
                )),

            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Switch(onChanged: (s){
                      if(onChange != null && ((areasModel?.isLoading ?? false) == false) ){
                        onChange!(s);
                      }
                    },
                      activeColor: AppColors.primaryColor(),
                      value: areasModel?.userActiveThisArea == 1,),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
