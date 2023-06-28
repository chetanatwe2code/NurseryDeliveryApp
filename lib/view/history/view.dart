import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nursery_driver/view/history/widget/history_widget.dart';

import '../home/widget/order_shimmer_widget.dart';
import '../widget/api_error/no_internet.dart';
import '../widget/api_error/not_found.dart';
import '../../controller/history_logic.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<HistoryLogic>().getHistory();
    return Scaffold(
      appBar: AppBar(title: const Text("Order History"),),
      body: GetBuilder<HistoryLogic>(
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
                if(logic.getDataProcess)...[
                  const Flexible(child: OrderShimmerWidget()),
                ]else...[
                  if(logic.orderModel.isNotEmpty)...[
                    Flexible(
                      child: ListView.builder(
                        itemCount: logic.orderModel.length,
                        padding: EdgeInsets.only(top: 15.r, left: 15.r, right: 15.r),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return HistoryWidget(orderModel: logic.orderModel[index],);
                        },),
                    ),
                  ]else...[
                    SizedBox(height: Get.height/3,),
                    const NotFound(),
                  ],

                ]
              ],
            ],
          );
        },
      ),
    );
  }
}