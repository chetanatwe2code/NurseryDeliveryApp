class ApiProvider{

  //static const String baseUrl = 'http://192.168.29.109:8888/';
  //static const String baseUrl = 'https://nursery-live-1.onrender.com/';
  static const String baseUrl = 'https://nursery-verient-live.onrender.com/';

  /// Auth APIs
  static const String driverLogin = 'driver_login';
  static const String driverForgotPassword = 'driver_forgate_password';
  static const String setNotificationToken = 'set_driver_notification_token';
  static const String driverDetails = 'driver_details';
  static const String driverUpdate = 'update_driver';
  static const String driverRegister = 'sign_by_driver';
  static const String driverVerify = 'driver_otp_verify';
  static const String changePassword = 'driver_forgate_password_update';

  /// Working Area API
  static const String addWorkingArea = 'add_working_area';
  static const String activeDeactivateArea = 'active_deactive_area';

  /// Vehicle API
  static const String registerVehicle = 'register_your_vehicle';
  static const String getVehicle = 'vehicle_list';
  static const String myAreas = 'delivery_area_list';

  /// order API
  static const String getOrder = 'get_delivery_detaile_list';
  static const String closeOrder = '';
  static const String getOrderProduct = 'order_details_for_driver';
  static const String deliveryComplete = 'delivery_verify_code_match';
  static const String deliveryClose = 'change_order_detaile_status';

  /// Session key
  static const String preferencesToken = 'USER_TOKEN';
  static const String preferencesIsLogin = 'USER_LOGGED_IN';

}