import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../theme/app_colors.dart';
import '../widget/common_material_button.dart';
import '../widget/input_field/common_input_field.dart';
import 'logic.dart';

class AddVehiclePage extends StatefulWidget {
  const AddVehiclePage({Key? key}) : super(key: key);

  @override
  State<AddVehiclePage> createState() => _AddVehiclePageState();
}

class _AddVehiclePageState extends State<AddVehiclePage> {

  final controller = Get.find<AddVehicleLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Register Vehicle"),),
      bottomSheet: Container(
        height: 0,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GetBuilder<AddVehicleLogic>(
          assignId: true,
          builder: (logic) {
            return Row(
              children: [
                Flexible(
                  child: CommonMaterialButton(text: "Register now",
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
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              20.verticalSpace,

              ///
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Vehicle Owner Name"),
              ),
              CommonInputField(
                hintText: 'Owner Name',
                labelText: "Owner Name",
                maxLength: 20,
                keyboardType: TextInputType.name,
                textController: controller.ownerNameController,
                suffixIcon: const Icon(Icons.person),
              ),

              ///
              20.verticalSpace,
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Brand/Company Name"),
              ),
              CommonInputField(
                hintText: 'Enter Vehicle Brand',
                labelText: "Brand",
                maxLength: 20,
                keyboardType: TextInputType.text,
                textController: controller.brandController,
                suffixIcon: const Icon(Icons.numbers),
              ),

              ///
              20.verticalSpace,
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Model"),
              ),
              CommonInputField(
                hintText: 'Enter Brand Model',
                labelText: "Model",
                maxLength: 25,
                textController: controller.modelController,
                keyboardType: TextInputType.text,
                suffixIcon: const Icon(Icons.model_training),
              ),

              ///
              20.verticalSpace,
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    const Text("Vehicle Color:",style: TextStyle(
                      fontSize: 20
                    ),),

                    10.horizontalSpace,

                    InkWell(
                      onTap: () {
                        showDialog<void>(
                          context: context,
                          barrierDismissible: false, // user must tap button!
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Pick a color!'),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor: controller.pickerColor,
                                  onColorChanged: controller.changeColor,
                                ),
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  child: const Text('Got it'),
                                  onPressed: () {
                                    controller.changeCurrentColor();
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Obx(() {
                        return Container(
                          height: 32,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: controller.currentColor.value,
                              border: Border.all(color: Colors.grey, width: 0.5),
                              borderRadius: const BorderRadius.all(Radius.circular(5))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Vehicle Color", style: TextStyle(
                                  color: Theme
                                      .of(context)
                                      .hintColor
                              ),),
                              10.horizontalSpace,
                              Container(
                                height: 25,
                                width: 25,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle
                                ),
                                child: Icon(Icons.colorize,
                                  size: 17,
                                  color: AppColors.iconColor(),),
                              )
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),


              ///
              20.verticalSpace,
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Vehicle Registration Number"),
              ),
              CommonInputField(
                hintText: 'Vehicle Number',
                labelText: "Vehicle No.",
                maxLength: 10,
                textController: controller.vehicleNumberController,
                keyboardType: TextInputType.text,
                suffixIcon: const Icon(Icons.delivery_dining),
              ),

              ///
              20.verticalSpace,
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text("Chassis Number (Optional)"),
              ),
              CommonInputField(
                hintText: 'Chassis Number',
                labelText: "Chassis No.",
                maxLength: 17,
                textController: controller.chassisNumberController,
                keyboardType: TextInputType.text,
                suffixIcon: const Icon(Icons.confirmation_num),
              ),

              20.verticalSpace,

            ],
          ),
        ),
      ),
    );
  }
}
