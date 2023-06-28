import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nursery_driver/view/working_areas/widget/working_area.dart';

import '../../theme/app_colors.dart';
import '../widget/api_error/no_internet.dart';
import '../widget/api_error/not_found.dart';
import 'logic.dart';

class WorkingAreasPage extends StatelessWidget {
  const WorkingAreasPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.find<WorkingAreasLogic>().getAreas();
    return Scaffold(
      appBar: AppBar(title: const Text("Set Location"),),
      body: GetBuilder<WorkingAreasLogic>(
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
                if(logic.list.isEmpty)...[
                  SizedBox(height: Get.height/3,),
                  const NotFound(),
                ]else...[

                  20.verticalSpace,

                  // Padding(
                  //   padding: EdgeInsets.only(top: 15.r, left: 15.r, right: 15.r),
                  //   child: Text("Active Working Area",
                  //     style: TextStyle(
                  //         color: AppColors.textColor(),
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.bold
                  //     ),),
                  // ),

                  Flexible(
                    child: ListView.builder(
                      itemCount: logic.list.length,
                      padding: EdgeInsets.only(top: 15.r, left: 15.r, right: 15.r),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return WorkingArea(
                          onChange: (s){
                            logic.activeInActiveArea(s,index);
                          },
                          areasModel: logic.list[index],);
                      },),
                  ),
                ]
              ],
            ],
          );
        },
      ),
    );
  }
}
