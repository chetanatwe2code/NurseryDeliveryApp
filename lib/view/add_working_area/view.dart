
// this code is working on button "Save Location" when keyboard is open then button above to keyboard automatically

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nursery_driver/core/routes.dart';
import 'package:nursery_driver/view/map/view.dart';

import '../../theme/app_colors.dart';
import '../map/binding.dart';
import '../widget/common_material_button.dart';
import '../widget/input_field/common_input_field.dart';
import 'logic.dart';

class AddWorkingAreaPage extends GetView<AddWorkingAreaLogic> {
  const AddWorkingAreaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Location")),
      bottomSheet: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GetBuilder<AddWorkingAreaLogic>(
          assignId: true,
          builder: (logic) {
            return Row(
              children: [
                Flexible(
                  child: CommonMaterialButton(text: "Save Location",
                      color: AppColors.primaryColor(),
                      borderRadius: 5,
                      fontColor: AppColors.whiteColor(),
                      isLoading: logic.saveProcess,
                      onTap: () {
                        logic.save();
                      }),
                ),

              ],
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              20.verticalSpace,

              ///
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("City"),
              ),
              CommonInputField(
                hintText: 'City',
                labelText: "City",
                keyboardType: TextInputType.streetAddress,
                textController: controller.cityController,
                suffixIcon: const Icon(Icons.location_city),
              ),

              ///
              20.verticalSpace,
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Area Name"),
              ),
              CommonInputField(
                hintText: 'Enter Area Name',
                labelText: "Area",
                keyboardType: TextInputType.streetAddress,
                textController: controller.areaNameController,
                suffixIcon: const Icon(Icons.pin_drop),
              ),

              ///
              20.verticalSpace,
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Pin Code"),
              ),
              CommonInputField(
                hintText: 'Enter Pin Code',
                labelText: "Pin Code",
                maxLength: 6,
                textController: controller.pinCodeController,
                keyboardType: TextInputType.number,
                suffixIcon: const Icon(Icons.pin),
              ),

              ///
              20.verticalSpace,

              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(onPressed: (){
                      Get.to(MapPage(callback: controller.callback),binding: MapBinding());
                    }, child: const Text("GO TO MAP",
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),)
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}
