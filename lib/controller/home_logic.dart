import 'package:get/get.dart';
import 'package:nursery_driver/model/OrderModel.dart';
import 'package:nursery_driver/view/widget/toast.dart';

import '../repository/order_repo.dart';

enum OrderStatueData { ready_to_pickup , Pickup , Delivered , Failed_Delivery_Attempts , Rejected_by_customer }

class OrderStatusModel{
  final OrderStatueData filters;
  final String title;
  final String key;
  OrderStatusModel({required this.filters,required this.title,required this.key});
}

class HomeLogic extends GetxController implements GetxService{
  final OrderRepo orderRepo;
  HomeLogic({required this.orderRepo});

  List<OrderModel> orderModel = [];
  bool isFilterData = false;

  List<OrderStatusModel> filterList = [
    OrderStatusModel(filters: OrderStatueData.ready_to_pickup,title: "Ready To Pickup",key: "ready_to_pickup"),
    OrderStatusModel(filters: OrderStatueData.Pickup,title: "In Transit",key: "Pickup"),
    OrderStatusModel(filters: OrderStatueData.Delivered,title: "Delivered",key: "Delivered"),
    OrderStatusModel(filters: OrderStatueData.Failed_Delivery_Attempts,title: "Rejected By Driver",key: "Failed_Delivery_Attempts"),
    OrderStatusModel(filters: OrderStatueData.Rejected_by_customer,title: "Rejected By Customer",key: "Rejected_by_customer"),
  ];


  OrderStatusModel? selectedFilter;
  String? fromDate;
  String? toDate;
  resetFilter({ OrderStatusModel? filtersModel ,String? fromDate, String? toDate }){
    selectedFilter = filtersModel;
    this.fromDate = fromDate;
    this.toDate = toDate;
    getOrderListByFilter();
  }

  bool getData = false;
  bool noInternet = false;
  getOrderList(){
    getData = true;
    noInternet = false;
    isFilterData = false;
    selectedFilter = null;
    fromDate = null;
    toDate = null;
    orderModel.clear();
    update();
    orderRepo.getOrder({}).then((value) => {
      getData = false,
      if(value.statusCode == -1){
        noInternet = true,
        update(),
      }else{
        if(value.statusCode == 200){
          initData(value.body),
        },
        update(),
      },
    },onError: (e){
      getData = false;
      if(e.statusCode == -1){
        noInternet = true;
      }
      update();
    }).catchError((e){
      getData = false;
      update();
    });
  }

  getOrderListByFilter(){
    getData = true;
    isFilterData = true;
    noInternet = false;
    orderModel.clear();
    update();
    orderRepo.getOrder({
      "order_status" : selectedFilter?.key??"",
      "date_from": fromDate??"",
      "date_to":toDate??""
    }).then((value) => {
      getData = false,
      if(value.statusCode == -1){
        noInternet = true,
        update(),
      }else{
        if(value.statusCode == 200){
          initData(value.body),
        },
        update(),
      },
    },onError: (e){
      getData = false;
      if(e.statusCode == -1){
        noInternet = true;
      }
      update();
    });
  }

  initData(dynamic data){
    try{
      if (data.isNotEmpty){
        data.forEach((v){
          orderModel.add(OrderModel.fromJson(v));
        });
      }
    }catch(e){
      //
    }
  }

  pullRefresh() async{
    await getOrderList();
  }

}
