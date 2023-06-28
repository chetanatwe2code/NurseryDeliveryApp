import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nursery_driver/view/account/widget/profile_menu_item.dart';
import 'package:nursery_driver/view/test/view.dart';

import '../../controller/account_logic.dart';
import '../../core/routes.dart';
import '../../theme/app_colors.dart';
import '../widget/api_error/no_internet.dart';
import '../widget/common_image.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Get.find<AccountLogic>().getAccountDetails();
    return Scaffold(
      appBar: AppBar(title: const Text("Account"),),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GetBuilder<AccountLogic>(
          assignId: true,
          builder: (logic) {
            return Column(
              children: [

                if(logic.noInternet)...[
                  SizedBox(height: MediaQuery.of(context).size.height / 3,),
                  NoInternet(
                    retry: (){
                      logic.pullRefresh();
                    },
                  ),
                ]else...[
                  25.verticalSpace,

                  Container(
                    padding: REdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    margin: REdgeInsets.only(bottom: 27),
                    child: Row(
                      children: [
                        Container(
                          width: 64.r,
                          height: 64.r,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1.r,
                              color: AppColors.blackColor().withOpacity(0.1),
                            ),
                            borderRadius: BorderRadius.circular(64.r),
                          ),
                          child: CommonImage(
                            imageUrl: logic.driverModel?.image ?? "",
                            assetPlaceholder: "assets/images/default_user.jpg",
                            width: 60,
                            height: 60,
                            radius: 30,
                          ),
                        ),
                        15.horizontalSpace,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${logic.driverModel?.driverName ?? ""} ${logic
                                  .driverModel?.driverLastName ?? ""}",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 20.sp,
                                letterSpacing: -1,
                                color: AppColors.textColor(),
                              ),
                            ),
                            3.verticalSpace,
                            Text(logic.driverModel?.email ?? "",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                letterSpacing: -1,
                                color: AppColors.textColor(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  15.verticalSpace,

                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [

                          ProfileMenuItem(
                            title: "Test",
                            onClick: () =>
                            {
                             // Get.to(TestPage())
                            },
                            icon: Icons.edit_location_alt_sharp,
                          ),

                          ProfileMenuItem(
                            title: "Set Location",
                            onClick: () =>
                            {
                              Get.toNamed(rsWorkingAreasPage)
                            },
                            icon: Icons.edit_location_alt_sharp,
                          ),

                          ProfileMenuItem(
                            title: "Add Location",
                            onClick: () =>
                            {
                              Get.toNamed(rsAddWorkingAreaPage)
                            },
                            icon: Icons.add_location_alt,
                          ),

                          ProfileMenuItem(
                            title: "Register Vehicle",
                            onClick: () =>
                            {
                              Get.toNamed(rsAddVehiclePage)
                            },
                            icon: Icons.local_shipping,
                          ),

                          ProfileMenuItem(
                            title: "Vehicle List",
                            onClick: () =>
                            {
                              Get.toNamed(rsVehicleListPage)
                            },
                            icon: Icons.local_shipping,
                          ),

                          ProfileMenuItem(
                            title: "Edit Profile",
                            onClick: () =>
                            {
                              Get.toNamed(rsEditProfilePage)
                            },
                            icon: FlutterRemix.edit_2_fill,
                          ),

                          ProfileMenuItem(
                            title: "Change Password",
                            onClick: () =>
                            {
                              Get.toNamed(rsChangePasswordPage)
                            },
                            icon: FlutterRemix.lock_password_fill,
                          ),

                          ProfileMenuItem(
                            title: "Logout",
                            onClick: () {
                              logic.logout();
                            },
                            icon: FlutterRemix.logout_circle_r_fill,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
