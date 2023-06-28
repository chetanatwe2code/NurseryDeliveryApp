import 'package:nursery_driver/model/OrderModel.dart';

import '../controller/home_logic.dart';

class StringHelper{

  static String fistValueOfCommaSeparated({String? value}) {
    value ??= "";
    final split = value.split(',');
    for (int i = 0; i < split.length; i++){
      return split[i];
    }
    return "";
  }

  List<String> listOfCommaSeparated({ String? value }){
    value ??= "";
    List<String> list = [];
    if(value.isEmpty) return list;
    final split = value.split(',');
    for (int i = 0; i < split.length; i++){
      if(split[i].trim() != ""){
        list.add(split[i]);
      }
    }
    return list;
  }


  static OrderStatusModel getStatusModel(String key){
    if(key == OrderStatueData.Delivered.name){
      return OrderStatusModel(
        filters: OrderStatueData.Delivered,
        title: "Delivered",
        key: OrderStatueData.Delivered.name
      );
    }
    if(key == OrderStatueData.Pickup.name){
      return OrderStatusModel(
          filters: OrderStatueData.Pickup,
          title: "In Transit",
          key: OrderStatueData.Pickup.name
      );
    }
    if(key == OrderStatueData.ready_to_pickup.name){
      return OrderStatusModel(
          filters: OrderStatueData.ready_to_pickup,
          title: "Ready To Pickup",
          key: OrderStatueData.ready_to_pickup.name
      );
    }
    if(key == OrderStatueData.Rejected_by_customer.name){
      return OrderStatusModel(
          filters: OrderStatueData.Rejected_by_customer,
          title: "Rejected by customer",
          key: OrderStatueData.Rejected_by_customer.name
      );
    }
    if(key == OrderStatueData.Failed_Delivery_Attempts.name){
      return OrderStatusModel(
          filters: OrderStatueData.Failed_Delivery_Attempts,
          title: "Rejected by driver",
          key: OrderStatueData.Failed_Delivery_Attempts.name
      );
    }
    return OrderStatusModel(
        filters: OrderStatueData.Pickup,
        title: "In Transit",
        key: OrderStatueData.Pickup.name
    );
  }

}