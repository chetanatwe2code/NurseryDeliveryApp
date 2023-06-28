import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controller/account_logic.dart';
import '../../theme/app_colors.dart';
import '../widget/common_image.dart';
import '../widget/common_material_button.dart';
import '../widget/gender_radio_group.dart';
import '../widget/input_field/common_input_field.dart';
import '../widget/show_animated_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {


  File? file;
  File? licence;
  File? aadhar;

  int fileType = 01;
  int licenceType = 02;
  int aadharType = 03;

  @override
  Widget build(BuildContext context) {
    AccountLogic controller = Get.find<AccountLogic>();
    controller.initData();
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Profile"),),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              10.verticalSpace,

              GetBuilder<AccountLogic>(builder: (logic) {
                return Container(
                  padding: REdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  margin: REdgeInsets.only(bottom: 27),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          getGalleryOrCamara(fileType);
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 70.r,
                              height: 70.r,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.r,
                                  color: AppColors.blackColor().withOpacity(
                                      0.1),
                                ),
                                borderRadius: BorderRadius.circular(70.r),
                              ),
                              child:
                              file != null ?
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(40)),
                                  color: Theme
                                      .of(context)
                                      .selectedRowColor,
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(40.0),
                                  child: Image.file(File(file?.path ?? ""),
                                    height: 70.0,
                                    width: 70.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ) :
                              CommonImage(
                                imageUrl: controller.driverModel?.image ?? "",
                                assetPlaceholder: "assets/images/default_user.jpg",
                                width: 70,
                                height: 70,
                                radius: 35,
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 5,
                                child: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          AppColors.primaryColor(),
                                          AppColors.whiteColor(),
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight,
                                      ),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AppColors.primaryColor(),
                                        style: BorderStyle.solid,
                                        width: 0.5,
                                      ),
                                    ),
                                    child: const Icon(Icons.photo, size: 15,
                                      color: Colors.white54,)
                                )
                            )
                          ],
                        ),
                      ),
                      15.horizontalSpace,
                      Flexible(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${logic.driverModel?.driverName ?? ""} ${logic
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
                      )
                    ],
                  ),
                );
              }),

              20.verticalSpace,

              Text("Personal Info",
                style: TextStyle(
                    color: AppColors.textColor(),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold
                ),),

              20.verticalSpace,

              CommonInputField(
                hintText: 'Enter first name',
                labelText: "First Name",
                maxLength: 15,
                textController: controller.firstNameController,
                keyboardType: TextInputType.name,
                suffixIcon: const Icon(Icons.person),
              ),

              20.verticalSpace,


              CommonInputField(
                hintText: 'Enter last name',
                labelText: "Last Name",
                maxLength: 15,
                textController: controller.lastNameController,
                keyboardType: TextInputType.name,
                suffixIcon: const Icon(Icons.person),
              ),

              20.verticalSpace,

              const Text("Date of brith", style: TextStyle(
                  fontSize: 15
              ),),

              5.verticalSpace,

              GetBuilder<AccountLogic>(
                assignId: true,
                builder: (logic) {
                  return InkWell(
                    onTap: () {
                      selectDateOfBrith(context).then((value) =>
                      {
                        logic.dateOfBrith = value,
                        logic.update()
                      });
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.5),
                          borderRadius: const BorderRadius.all(Radius.circular(
                              5)),
                          color: Colors.grey.withOpacity(0.1)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(logic.dateOfBrith ?? "Date of brith", style: TextStyle(
                              color: logic.dateOfBrith != null ? AppColors.textColor() : Theme
                                  .of(context)
                                  .hintColor
                          ),),

                          Icon(Icons.calendar_month,
                            color: Theme
                                .of(context)
                                .hintColor,),
                        ],
                      ),
                    ),
                  );
                },
              ),

              20.verticalSpace,

              const Text("Gender", style: TextStyle(
                  fontSize: 15
              ),),

              5.verticalSpace,

              GenderRadioGroup(
                initialValue: controller.gender,
                callback: (Gender g){
                  controller.setSender(g);

                },
              ),

              20.verticalSpace,

              Text("Contact Info",
                style: TextStyle(
                    color: AppColors.textColor(),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold
                ),),

              20.verticalSpace,


              CommonInputField(
                hintText: 'Enter phone number',
                labelText: "Number",
                maxLength: 10,
                textController: controller.numberController,
                keyboardType: TextInputType.phone,
                suffixIcon: const Icon(Icons.phone),
              ),


              20.verticalSpace,

              Text("Id Prof",
                style: TextStyle(
                    color: AppColors.textColor(),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold
                ),),

              20.verticalSpace,

              CommonInputField(
                hintText: 'Aadhar number',
                labelText: "Aadhar number",
                maxLength: 12,
                textController: controller.aadharController,
                keyboardType: TextInputType.number,
                suffixIcon: const Icon(Icons.receipt_long_outlined),
              ),

              20.verticalSpace,

              InkWell(
                onTap: controller.driverModel?.aadharCard?.isNotEmpty??false ? null : (){
                  getGalleryOrCamara(aadharType);
                },
                child: Container(
                  height: 150,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: AppColors.grayColor().withOpacity(0.5)
                  ),
                  child:
                  aadhar != null ?
                  Image.file(aadhar!) :
                  CommonImage(
                    imageUrl: controller.driverModel?.aadharCard,
                    assetPlaceholder: "assets/images/aadhar.jpg",
                  ),
                ),
              ),

              30.verticalSpace,

              CommonInputField(
                hintText: 'Licence number',
                labelText: "Licence number",
                textController: controller.licenceNoController,
                keyboardType: TextInputType.text,
                suffixIcon: const Icon(Icons.receipt_long_outlined),
              ),

              20.verticalSpace,

              InkWell(
                onTap: controller.driverModel?.licence?.isNotEmpty??false ? null : (){
                  getGalleryOrCamara(licenceType);
                },
                child: Container(
                  height: 150,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: AppColors.grayColor().withOpacity(0.5)
                  ),
                  child:
                  licence != null ?
                  Image.file(licence!) :
                  CommonImage(
                    imageUrl: controller.driverModel?.licence,
                    assetPlaceholder: "assets/images/licence.jpg",
                  ),
                ),
              ),

              30.verticalSpace,

              Text("Current Address Detail",
                style: TextStyle(
                    color: AppColors.textColor(),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.bold
                ),),


              20.verticalSpace,

              CommonInputField(
                hintText: 'Address',
                labelText: "Address",
                textController: controller.addressController,
                keyboardType: TextInputType.streetAddress,
                suffixIcon: const Icon(Icons.location_on),
              ),

              30.verticalSpace,

              Obx(() {
                return CommonMaterialButton(text: "Update Profile",
                    color: AppColors.primaryColor(),
                    borderRadius: 5,
                    fontColor: AppColors.whiteColor(),
                    isLoading: controller.updateProcess.value,
                    onTap: () {
                      controller.updateDriver(
                          file: file, licence: licence, aadhar: aadhar);
                    });
              }),

              10.verticalSpace,

            ],
          ),
        ),
      ),
    );
  }



  Future<void> getGalleryOrCamara(int type) async {
    return showAnimatedDialog(context, Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Stack(
          clipBehavior: Clip.none,
          children: [

            Positioned(
              left: 0,
              top: 5,
              child: Row(
                children: [
                  Icon(Icons.photo, color: Theme
                      .of(context)
                      .highlightColor, size: 24,),
                  const SizedBox(width: 10,),
                  const Text("Choose option",),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Divider(height: 1, color: Theme
                        .of(context)
                        .primaryColor,),
                    ListTile(
                      onTap: () {
                        pickGalleryPic(type).then((value) =>
                        {
                          Navigator.pop(context)
                        });
                      },
                      title: const Text("Gallery"),
                      leading: Icon(Icons.perm_media, color: Theme
                          .of(context)
                          .highlightColor,),
                    ),

                    Divider(height: 1, color: Theme
                        .of(context)
                        .primaryColor,),
                    ListTile(
                      onTap: () {
                        pickCameraPic(type).then((value) =>
                        {
                          Navigator.pop(context),
                        });
                      },
                      title: const Text("Camera"),
                      leading: Icon(Icons.camera, color: Theme
                          .of(context)
                          .highlightColor,),
                    ),
                  ],
                ),
              ),),

          ],
        ),
      ),
    ), dismissible: true);
  }


  Future<void> pickGalleryPic(int type) async {
    try {
      await FilePicker.platform.pickFiles(
          withReadStream: true, type: FileType.image).then((value) =>
      {
        if(value != null){
          if(type == fileType){
            file = File(value.files.single.path!),
          },
          if(type == aadharType){
            aadhar = File(value.files.single.path!),
          },
          if(type == licenceType){
            licence = File(value.files.single.path!),
          },
          if(mounted){
            setState(() {})
          }
        },
      });
    } catch (e) {
      //
    }
  }

  Future<void> pickCameraPic(int type) async {
    try {
      final ImagePicker picker = ImagePicker();
      final mImage = await picker.pickImage(source: ImageSource.camera);
      if (mImage == null) return;
      await getFile(File(mImage.path)).then((value) =>
      {
        if(type == fileType){
          file = value,
        },
        if(type == aadharType){
          aadhar = value,
        },
        if(type == licenceType){
          licence = value,
        },
        if(mounted){
          setState(() {}),
        },
      });
    } on PlatformException catch (e) {
      //
    }
  }
}

Future<File> getFile(File file) async {
  return file;
}

Future<String> selectDateOfBrith(BuildContext context) async {
  DateTime lastDate = DateTime.now().subtract(const Duration(days: 1));

  DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: lastDate,
      firstDate: DateTime(1900),
      lastDate: lastDate
  );
  if (pickedDate != null) {
    return Future.value(DateFormat('yyyy-MM-dd').format(pickedDate));
  }
  return Future.error("Date Not Found");
}
