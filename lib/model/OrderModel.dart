/// orders_details_id : 1
/// payment : 200
/// order_status : "comming_soon"
/// payment_method : "cod"
/// order_asign_date : "2023-05-04T06:33:06.000Z"
/// driver_id : 5
/// driver_name : "name"
/// driver_last_name : "name"
/// date_of_birth : "name"
/// contect_no : "name"
/// order_id : 398080
/// order_date : "name"
/// product_id : "name"
/// shipping_charges : "name"
/// delivery_date : "name"
/// delivery_lat : "name"
/// delivery_log : "name"
/// user_name : "name"
/// address : "name"
/// user_email : "name"
/// pin_code : "name"
/// city : "name"
/// user_image : "name"
/// phone_no : "name"
/// vehicle_id : 1
/// registration_no_of_vehicle : "123456789"

class OrderModel {
  OrderModel({
      this.ordersDetailsId, 
      this.payment, 
      this.orderStatus, 
      this.paymentMethod, 
      this.orderAsignDate, 
      this.driverId, 
      this.driverName, 
      this.driverLastName, 
      this.dateOfBirth, 
      this.contectNo, 
      this.orderId, 
      this.orderDate, 
      this.productId, 
      this.shippingCharges, 
      this.deliveryDate, 
      this.deliveryLat, 
      this.deliveryLog, 
      this.userName, 
      this.address, 
      this.userEmail, 
      this.pinCode, 
      this.city, 
      this.userImage, 
      this.phoneNo, 
      this.vehicleId, 
      this.registrationNoOfVehicle,});

  OrderModel.fromJson(dynamic json) {
    try{
      ordersDetailsId = json['orders_details_id'];
      payment = json['payment'];
      orderStatus = json['order_status'];
      paymentMethod = json['payment_method'];
      orderAsignDate = json['order_asign_date'];
      driverId = json['driver_id'];
      driverName = json['driver_name'];
      driverLastName = json['driver_last_name'];
      dateOfBirth = json['date_of_birth'];
      contectNo = json['contect_no'];
      orderId = json['order_id'];
      orderDate = json['order_date'];
      productId = json['product_id'];
      shippingCharges = json['shipping_charges'];
      deliveryDate = json['delivery_date'];
      deliveryLat = json['delivery_lat'];
      deliveryLog = json['delivery_log'];
      userName = json['user_name'];
      address = json['address'];
      userEmail = json['user_email'];
      pinCode = json['pin_code'];
      city = json['city'];
      userImage = json['user_image'];
      phoneNo = json['phone_no'];
      totalOrderProductQuantity = json['total_order_product_quantity'];
      vehicleId = json['vehicle_id'];
      registrationNoOfVehicle = json['registration_no_of_vehicle'];
    }catch(e){
      //
    }
  }
  int? ordersDetailsId;
  int? payment;
  String? orderStatus;
  String? paymentMethod;
  String? orderAsignDate;
  int? driverId;
  String? driverName;
  String? driverLastName;
  String? dateOfBirth;
  String? contectNo;
  int? orderId;
  String? orderDate;
  int? productId;
  String? shippingCharges;
  String? deliveryDate;
  double? deliveryLat;
  double? deliveryLog;
  String? userName;
  String? address;
  String? userEmail;
  String? pinCode;
  String? city;
  String? userImage;
  String? phoneNo;
  String? totalOrderProductQuantity;
  int? vehicleId;
  String? registrationNoOfVehicle;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['orders_details_id'] = ordersDetailsId;
    map['payment'] = payment;
    map['order_status'] = orderStatus;
    map['payment_method'] = paymentMethod;
    map['order_asign_date'] = orderAsignDate;
    map['driver_id'] = driverId;
    map['driver_name'] = driverName;
    map['driver_last_name'] = driverLastName;
    map['date_of_birth'] = dateOfBirth;
    map['contect_no'] = contectNo;
    map['order_id'] = orderId;
    map['order_date'] = orderDate;
    map['product_id'] = productId;
    map['shipping_charges'] = shippingCharges;
    map['delivery_date'] = deliveryDate;
    map['delivery_lat'] = deliveryLat;
    map['delivery_log'] = deliveryLog;
    map['user_name'] = userName;
    map['address'] = address;
    map['user_email'] = userEmail;
    map['pin_code'] = pinCode;
    map['city'] = city;
    map['user_image'] = userImage;
    map['phone_no'] = phoneNo;
    map['total_order_product_quantity'] = totalOrderProductQuantity;
    map['vehicle_id'] = vehicleId;
    map['registration_no_of_vehicle'] = registrationNoOfVehicle;
    return map;
  }

}