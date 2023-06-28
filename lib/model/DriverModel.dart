/// driver_id : 7
/// driver_name : "name"
/// driver_last_name : "sdvsf"
/// date_of_birth : "Sdvsv"
/// current_address : "SDvibijvnsv"
/// gender : "M"
/// age : 47
/// contect_no : "4527896538"
/// email : "chetan.barod.we2code@gmail.com"
/// password : "12345@abcd"
/// status : "pending"
/// contect_no_is_verified : 0
/// aadhar_no : "8zb8z4z4"
/// licence_no : "sdvmsdvsdv4584"
/// licence_issue_date : "2023-05-03T04:43:28.000Z"
/// licence_validity_date : "2023-05-03T04:43:28.000Z"
/// is_active : 1
/// created_on : "2023-05-03T04:43:28.000Z"
/// updated_on : "2023-05-03T04:43:28.000Z"
/// current_latitude : 12.12
/// current_longitude : 12.12
/// fcm_token : ""

class DriverModel {
  DriverModel({
      this.driverId, 
      this.driverName, 
      this.driverLastName, 
      this.dateOfBirth, 
      this.currentAddress, 
      this.gender, 
      this.age, 
      this.contectNo, 
      this.email, 
      this.password, 
      this.status, 
      this.contectNoIsVerified, 
      this.aadharNo, 
      this.licenceNo, 
      this.licenceIssueDate, 
      this.licenceValidityDate, 
      this.isActive, 
      this.createdOn, 
      this.updatedOn, 
      this.currentLatitude, 
      this.currentLongitude, 
      this.fcmToken,
      this.image});

  DriverModel.fromJson(dynamic json) {
    driverId = json['driver_id'];
    driverName = json['driver_name'];
    driverLastName = json['driver_last_name'];
    dateOfBirth = json['date_of_birth'];
    currentAddress = json['current_address'];
    gender = json['gender'];
    age = json['age'];
    contectNo = json['contect_no'];
    email = json['email'];
    password = json['password'];
    status = json['status'];
    contectNoIsVerified = json['contect_no_is_verified'];
    aadharNo = json['aadhar_no'];
    aadharCard = json['aadhar_card'];
    licence = json['licence'];
    licenceNo = json['licence_no'];
    licenceIssueDate = json['licence_issue_date'];
    licenceValidityDate = json['licence_validity_date'];
    isActive = json['is_active'];
    createdOn = json['created_on'];
    updatedOn = json['updated_on'];
    currentLatitude = json['current_latitude'];
    currentLongitude = json['current_longitude'];
    fcmToken = json['fcm_token'];
    image = json['image'];
  }
  int? driverId;
  String? driverName;
  String? driverLastName;
  String? dateOfBirth;
  String? currentAddress;
  String? gender;
  int? age;
  String? contectNo;
  String? email;
  String? password;
  String? status;
  int? contectNoIsVerified;
  String? aadharNo;
  String? aadharCard;
  String? licence;
  String? licenceNo;
  String? licenceIssueDate;
  String? licenceValidityDate;
  int? isActive;
  String? createdOn;
  String? updatedOn;
  double? currentLatitude;
  double? currentLongitude;
  String? fcmToken;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['driver_id'] = driverId;
    map['driver_name'] = driverName;
    map['driver_last_name'] = driverLastName;
    map['date_of_birth'] = dateOfBirth;
    map['current_address'] = currentAddress;
    map['gender'] = gender;
    map['age'] = age;
    map['contect_no'] = contectNo;
    map['email'] = email;
    map['password'] = password;
    map['status'] = status;
    map['contect_no_is_verified'] = contectNoIsVerified;
    map['aadhar_no'] = aadharNo;
    map['aadhar_card'] = aadharCard;
    map['licence'] = licence;
    map['licence_no'] = licenceNo;
    map['licence_issue_date'] = licenceIssueDate;
    map['licence_validity_date'] = licenceValidityDate;
    map['is_active'] = isActive;
    map['created_on'] = createdOn;
    map['updated_on'] = updatedOn;
    map['current_latitude'] = currentLatitude;
    map['current_longitude'] = currentLongitude;
    map['fcm_token'] = fcmToken;
    map['image'] = image;
    return map;
  }

}