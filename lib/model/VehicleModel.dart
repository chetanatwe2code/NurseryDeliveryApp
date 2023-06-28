/// vehicle_id : 1
/// driver_id : 7
/// company_name : "honda"
/// model : "shine"
/// color : "black"
/// registration_no_of_vehicle : "123456789"
/// chassis_number : "987654321"
/// vehicle_owner_name : "mayur"
/// make_of_vehicle : "2019-07-29T18:30:00.000Z"
/// created_on : "2023-05-04T05:26:41.000Z"
/// updated_on : "2023-05-04T05:26:41.000Z"
/// vehicle_registerd_by : null
/// puc_expiration_date : "2023-05-21T18:30:00.000Z"
/// insurance_expiration_date : "2023-05-16T18:30:00.000Z"
/// registration_expiration_date : "2023-05-14T18:30:00.000Z"
/// puc_certificate : "http://192.168.29.109:8888/driver_profile/puc_certificate-1683876561484download (7).jpeg"
/// insurance : "http://192.168.29.109:8888/driver_profile/insurance-1683876561485download.jpeg"
/// registration : "http://192.168.29.109:8888/driver_profile/registration-1683876561486download (8).jpeg"
/// is_active : 0

class VehicleModel {
  VehicleModel({
      num? vehicleId, 
      num? driverId, 
      String? companyName, 
      String? model, 
      String? color, 
      String? registrationNoOfVehicle, 
      String? chassisNumber, 
      String? vehicleOwnerName, 
      String? makeOfVehicle, 
      String? createdOn, 
      String? updatedOn, 
      dynamic vehicleRegisterdBy, 
      String? pucExpirationDate, 
      String? insuranceExpirationDate, 
      String? registrationExpirationDate, 
      String? pucCertificate, 
      String? insurance, 
      String? registration, 
      num? isActive,}){
    _vehicleId = vehicleId;
    _driverId = driverId;
    _companyName = companyName;
    _model = model;
    _color = color;
    _registrationNoOfVehicle = registrationNoOfVehicle;
    _chassisNumber = chassisNumber;
    _vehicleOwnerName = vehicleOwnerName;
    _makeOfVehicle = makeOfVehicle;
    _createdOn = createdOn;
    _updatedOn = updatedOn;
    _vehicleRegisterdBy = vehicleRegisterdBy;
    _pucExpirationDate = pucExpirationDate;
    _insuranceExpirationDate = insuranceExpirationDate;
    _registrationExpirationDate = registrationExpirationDate;
    _pucCertificate = pucCertificate;
    _insurance = insurance;
    _registration = registration;
    _isActive = isActive;
}

  VehicleModel.fromJson(dynamic json) {
    _vehicleId = json['vehicle_id'];
    _driverId = json['driver_id'];
    _companyName = json['company_name'];
    _model = json['model'];
    _color = json['color'];
    _registrationNoOfVehicle = json['registration_no_of_vehicle'];
    _chassisNumber = json['chassis_number'];
    _vehicleOwnerName = json['vehicle_owner_name'];
    _makeOfVehicle = json['make_of_vehicle'];
    _createdOn = json['created_on'];
    _updatedOn = json['updated_on'];
    _vehicleRegisterdBy = json['vehicle_registerd_by'];
    _pucExpirationDate = json['puc_expiration_date'];
    _insuranceExpirationDate = json['insurance_expiration_date'];
    _registrationExpirationDate = json['registration_expiration_date'];
    _pucCertificate = json['puc_certificate'];
    _insurance = json['insurance'];
    _registration = json['registration'];
    _isActive = json['is_active'];
  }
  num? _vehicleId;
  num? _driverId;
  String? _companyName;
  String? _model;
  String? _color;
  String? _registrationNoOfVehicle;
  String? _chassisNumber;
  String? _vehicleOwnerName;
  String? _makeOfVehicle;
  String? _createdOn;
  String? _updatedOn;
  dynamic _vehicleRegisterdBy;
  String? _pucExpirationDate;
  String? _insuranceExpirationDate;
  String? _registrationExpirationDate;
  String? _pucCertificate;
  String? _insurance;
  String? _registration;
  num? _isActive;
VehicleModel copyWith({  num? vehicleId,
  num? driverId,
  String? companyName,
  String? model,
  String? color,
  String? registrationNoOfVehicle,
  String? chassisNumber,
  String? vehicleOwnerName,
  String? makeOfVehicle,
  String? createdOn,
  String? updatedOn,
  dynamic vehicleRegisterdBy,
  String? pucExpirationDate,
  String? insuranceExpirationDate,
  String? registrationExpirationDate,
  String? pucCertificate,
  String? insurance,
  String? registration,
  num? isActive,
}) => VehicleModel(  vehicleId: vehicleId ?? _vehicleId,
  driverId: driverId ?? _driverId,
  companyName: companyName ?? _companyName,
  model: model ?? _model,
  color: color ?? _color,
  registrationNoOfVehicle: registrationNoOfVehicle ?? _registrationNoOfVehicle,
  chassisNumber: chassisNumber ?? _chassisNumber,
  vehicleOwnerName: vehicleOwnerName ?? _vehicleOwnerName,
  makeOfVehicle: makeOfVehicle ?? _makeOfVehicle,
  createdOn: createdOn ?? _createdOn,
  updatedOn: updatedOn ?? _updatedOn,
  vehicleRegisterdBy: vehicleRegisterdBy ?? _vehicleRegisterdBy,
  pucExpirationDate: pucExpirationDate ?? _pucExpirationDate,
  insuranceExpirationDate: insuranceExpirationDate ?? _insuranceExpirationDate,
  registrationExpirationDate: registrationExpirationDate ?? _registrationExpirationDate,
  pucCertificate: pucCertificate ?? _pucCertificate,
  insurance: insurance ?? _insurance,
  registration: registration ?? _registration,
  isActive: isActive ?? _isActive,
);
  num? get vehicleId => _vehicleId;
  num? get driverId => _driverId;
  String? get companyName => _companyName;
  String? get model => _model;
  String? get color => _color;
  String? get registrationNoOfVehicle => _registrationNoOfVehicle;
  String? get chassisNumber => _chassisNumber;
  String? get vehicleOwnerName => _vehicleOwnerName;
  String? get makeOfVehicle => _makeOfVehicle;
  String? get createdOn => _createdOn;
  String? get updatedOn => _updatedOn;
  dynamic get vehicleRegisterdBy => _vehicleRegisterdBy;
  String? get pucExpirationDate => _pucExpirationDate;
  String? get insuranceExpirationDate => _insuranceExpirationDate;
  String? get registrationExpirationDate => _registrationExpirationDate;
  String? get pucCertificate => _pucCertificate;
  String? get insurance => _insurance;
  String? get registration => _registration;
  num? get isActive => _isActive;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['vehicle_id'] = _vehicleId;
    map['driver_id'] = _driverId;
    map['company_name'] = _companyName;
    map['model'] = _model;
    map['color'] = _color;
    map['registration_no_of_vehicle'] = _registrationNoOfVehicle;
    map['chassis_number'] = _chassisNumber;
    map['vehicle_owner_name'] = _vehicleOwnerName;
    map['make_of_vehicle'] = _makeOfVehicle;
    map['created_on'] = _createdOn;
    map['updated_on'] = _updatedOn;
    map['vehicle_registerd_by'] = _vehicleRegisterdBy;
    map['puc_expiration_date'] = _pucExpirationDate;
    map['insurance_expiration_date'] = _insuranceExpirationDate;
    map['registration_expiration_date'] = _registrationExpirationDate;
    map['puc_certificate'] = _pucCertificate;
    map['insurance'] = _insurance;
    map['registration'] = _registration;
    map['is_active'] = _isActive;
    return map;
  }

}