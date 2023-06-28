import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nursery_driver/theme/app_colors.dart';
import 'package:nursery_driver/view/home/widget/order_shimmer_widget.dart';
import 'package:nursery_driver/view/home/widget/order_widget.dart';

import '../../controller/home_logic.dart';
import '../widget/api_error/no_internet.dart';
import '../widget/api_error/not_data.dart';
import '../widget/api_error/not_found.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<HomeLogic>().getOrderList();
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.1),
      appBar: AppBar(title: const Text("Home")),
      body: Padding(
        padding: EdgeInsets.only(top: 15.r,),
        child: GetBuilder<HomeLogic>(
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
                  if(logic.getData)...[
                    const Flexible(child: OrderShimmerWidget()),
                  ]else...[

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [

                          for(int i = 0;i<logic.filterList.length;i++)
                            InkWell(
                              onTap: (){
                                logic.resetFilter(filtersModel: logic.filterList[i]);
                              },
                              child: Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        logic.selectedFilter?.filters.name == logic.filterList[i].filters.name ? AppColors.darkPrimary : AppColors.primary,
                                        AppColors.darkPrimary,
                                      ],
                                    ),
                                    borderRadius: const BorderRadius.all(Radius.circular(25))
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 15.r),
                                margin: EdgeInsets.only(left: i == 0 ? 15.r : 7.r,right: 7),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(logic.filterList[i].title,
                                      style: TextStyle(
                                          color: AppColors.whiteColor()
                                      ),),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),

                    10.verticalSpace,

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.r),
                      child: Row(
                        children: [
                          Flexible(
                            child: Container(
                              height: 35,
                              decoration: BoxDecoration(
                                //color: AppColors.primaryColor(),
                                  gradient: LinearGradient(
                                    colors: [
                                      AppColors.primaryColor(),
                                      AppColors.darkPrimary,
                                    ],
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(25))
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: (){
                                      selectDate(context).then((value) => {
                                        logic.fromDate = value,
                                        logic.update()
                                      });
                                    },
                                    child: Text(logic.fromDate ?? "yyyy/mm/dd",
                                      style: TextStyle(
                                          color: logic.fromDate == null ? AppColors.whiteColor().withOpacity(0.5) : AppColors.whiteColor()
                                      ),),
                                  ),
                                  Text("To",
                                    style: TextStyle(
                                        color: AppColors.whiteColor()
                                    ),),
                                  InkWell(
                                    onTap: (){
                                      selectDate(context).then((value) => {
                                        logic.toDate = value,
                                        logic.update()
                                      });
                                    },
                                    child: Text(logic.toDate ?? "yyyy/mm/dd",
                                      style: TextStyle(
                                          color: logic.toDate == null ? AppColors.whiteColor().withOpacity(0.5) : AppColors.whiteColor()
                                      ),),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          10.horizontalSpace,
                          InkWell(
                            onTap: (){
                              logic.resetFilter(
                                  filtersModel: logic.selectedFilter,
                                  fromDate: logic.fromDate,
                                  toDate: logic.toDate
                              );
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(
                                  color: AppColors.darkPrimary,
                                  borderRadius: BorderRadius.all(Radius.circular(25))
                              ),
                              child: Icon(Icons.filter_alt_outlined,color: AppColors.whiteColor(),),
                            ),
                          ),
                        ],
                      ),
                    ),

                    if(logic.isFilterData)
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: (){
                              logic.getOrderList();
                            }, child: const Text("Clear Filter"))
                          ],
                        ),
                      ),

                    if(logic.orderModel.isNotEmpty)...[
                      Expanded(
                        child: ListView.builder(
                          itemCount: logic.orderModel.length,
                          padding: EdgeInsets.all(15.r),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return OrderWidget(
                              orderModel: logic.orderModel[index],);
                          },),
                      ),
                    ]else...[
                      SizedBox(height: Get.height/3,),
                      const NotFound(),
                    ],
                  ],
                ],

              ],
            );
          },
        ),
      ),
    );
  }

 Future<String> selectDate(BuildContext context) async{
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate:DateTime(2022),
        lastDate: DateTime(2100)
    );
    if(pickedDate != null){
      return Future.value(DateFormat('yyyy-MM-dd').format(pickedDate));
    }
    return Future.error("Date Not Found");
  }
}
