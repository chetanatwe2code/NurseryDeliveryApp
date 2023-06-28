/// id : 2
/// driver_id : "5"
/// city : "mandsaur"
/// area_name : "piplia"
/// pin_code : 458664
/// driver_log : 75.8545
/// driver_lat : 22.7177
/// status : ""
/// created_on : "2023-05-03T06:11:55.000Z"
/// updated_on : "2023-05-03T06:11:55.000Z"
/// is_active : 1
/// user_active_this_area : 5

class AreasModel {
  AreasModel({
      this.id, 
      this.driverId, 
      this.city, 
      this.areaName, 
      this.pinCode, 
      this.driverLog, 
      this.driverLat, 
      this.status, 
      this.createdOn, 
      this.updatedOn, 
      this.isActive, 
      this.userActiveThisArea,});

  AreasModel.fromJson(dynamic json) {
    try{
      id = json['id'];
      driverId = json['driver_id'];
      city = json['city'];
      areaName = json['area_name'];
      pinCode = json['pin_code'];
      driverLog = double.tryParse(json['driver_log'].toString());
      driverLat = double.tryParse(json['driver_lat'].toString());
      status = json['status'];
      createdOn = json['created_on'];
      updatedOn = json['updated_on'];
      isActive = json['is_active'];
      userActiveThisArea = json['user_active_this_area'];
    }catch(e){
      print("ERROR_DATA $e");
    }
  }
  int? id;
  String? driverId;
  String? city;
  String? areaName;
  int? pinCode;
  double? driverLog;
  double? driverLat;
  String? status;
  String? createdOn;
  String? updatedOn;
  int? isActive;
  int? userActiveThisArea;
  bool isLoading = false;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['driver_id'] = driverId;
    map['city'] = city;
    map['area_name'] = areaName;
    map['pin_code'] = pinCode;
    map['driver_log'] = driverLog;
    map['driver_lat'] = driverLat;
    map['status'] = status;
    map['created_on'] = createdOn;
    map['updated_on'] = updatedOn;
    map['is_active'] = isActive;
    map['user_active_this_area'] = userActiveThisArea;
    return map;
  }

}