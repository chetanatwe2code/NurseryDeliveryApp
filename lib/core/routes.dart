
import 'package:get/get.dart';
import 'package:nursery_driver/view/add_vehicle/binding.dart';
import 'package:nursery_driver/view/add_vehicle/view.dart';
import 'package:nursery_driver/view/add_working_area/binding.dart';
import 'package:nursery_driver/view/add_working_area/view.dart';
import 'package:nursery_driver/view/change_password/binding.dart';
import 'package:nursery_driver/view/change_password/view.dart';
import 'package:nursery_driver/view/forgot_password/binding.dart';
import 'package:nursery_driver/view/forgot_password/view.dart';
import 'package:nursery_driver/view/login/binding.dart';
import 'package:nursery_driver/view/login/view.dart';
import 'package:nursery_driver/view/order_details/binding.dart';
import 'package:nursery_driver/view/select_area/binding.dart';
import 'package:nursery_driver/view/sign_up/binding.dart';
import 'package:nursery_driver/view/verification/binding.dart';
import 'package:nursery_driver/view/working_areas/binding.dart';
import '../view/base_view.dart';
import '../view/edit_profile/binding.dart';
import '../view/edit_profile/view.dart';
import '../view/order_details/view.dart';
import '../view/select_area/view.dart';
import '../view/sign_up/view.dart';
import '../view/splash/binding.dart';
import '../view/splash/view.dart';
import '../view/vehicle_list/binding.dart';
import '../view/vehicle_list/view.dart';
import '../view/verification/view.dart';
import '../view/working_areas/view.dart';

/// application routes name
const String rsDefaultPage = "/";
const String rsLoginPage = "/loginScreen";
const String rsSignUpPage = "/signUpScreen";
const String rsVerificationPage = "/verificationScreen";
const String rsChangePasswordPage = "/rsChangePasswordScreen";
const String rsEditProfilePage = "/editProfileScreen";
const String rsForgotPasswordPage = "/rsForgotPasswordScreen";

const String rsBasePage = "/baseScreen";
const String rsOrderDetailsPage = "/OrderDetailsScreen";

const String rsSelectAreaPage = "/selectAreaScreen";
const String rsWorkingAreasPage = "/workingAreasScreen";
const String rsAddWorkingAreaPage = "/addWorkingAreaScreen";

const String rsAddVehiclePage = "/addVehicleScreen";
const String rsVehicleListPage = "/vehicleListScreen";

class Routes{
  static final routes = [
    GetPage(name: rsBasePage, page: () => const BasePage()),

    GetPage(name: rsDefaultPage, page: () => const SplashPage(),binding: SplashBinding()),
    GetPage(name: rsSelectAreaPage, page: () => const SelectAreaPage(),binding: SelectAreaBinding()),
    GetPage(name: rsWorkingAreasPage, page: () => const WorkingAreasPage(),binding: WorkingAreasBinding()),
    GetPage(name: rsAddWorkingAreaPage, page: () => const AddWorkingAreaPage(),binding: AddWorkingAreaBinding()),
    GetPage(name: rsLoginPage, page: () => const LoginPage(),binding: LoginBinding()),
    GetPage(name: rsSignUpPage, page: () => const SignUpPage(),binding: SignUpBinding()),
    GetPage(name: rsEditProfilePage, page: () => const EditProfilePage(),binding: EditProfileBinding()),
    GetPage(name: rsAddVehiclePage, page: () => const AddVehiclePage(),binding: AddVehicleBinding()),
    GetPage(name: rsVerificationPage, page: () => const VerificationPage(),binding: VerificationBinding()),
    GetPage(name: rsChangePasswordPage, page: () => const ChangePasswordPage(),binding: ChangePasswordBinding()),
    GetPage(name: rsForgotPasswordPage, page: () => const ForgotPasswordPage(),binding: ForgotPasswordBinding()),
    GetPage(name: rsOrderDetailsPage, page: () => const OrderDetailsPage(),binding: OrderDetailsBinding()),

    GetPage(name: rsVehicleListPage, page: () => const VehicleListPage(),binding: VehicleListBinding()),
  ];
}