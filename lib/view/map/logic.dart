import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';
import 'package:nursery_driver/view/map/view.dart';

class MapLogic extends GetxController {

  late MapmyIndiaMapController controller;

  static const String ACCESS_TOKEN = "0f6ca50b636bc6a881bcba87b85e4b82";
  static const String REST_API_KEY = "0f6ca50b636bc6a881bcba87b85e4b82";
  static const String ATLAS_CLIENT_ID = "33OkryzDZsIvlQysNqYT5DBRe6FSXBkXN4ojCcH4WwCRWbbU8Re-lBw-vtdxOThcWmhNloeec1yyqxm-u3Wd8kGFBxo2IMz-";
  static const String ATLAS_CLIENT_SECRET = "lrFxI-iSEg8OqNu33NUNi8XtHViSvI_tfqlZ-eE3B7NcQqrP6meeXzrg2VWHkaagWu8STiUygcB27T12qrCB1-ZepoApcxLI8T2U_oOpBfY=";

  AddressModel? place;
  LatLng locationData = const LatLng(22.737823947081186, 75.83358868959016);


  void setPermission() async {
    if (!kIsWeb) {
      final location = Location();
      final hasPermissions = await location.hasPermission();
      if (hasPermissions != PermissionStatus.granted) {
        await location.requestPermission();
      }
    }
  }

  void addMarker() async {
    SymbolOptions symbolOptions =  SymbolOptions(geometry: locationData);
    controller.addSymbol(symbolOptions);
    callPlaceDetail();
  }



  void updateMarkerPosition(LatLng position) async{
    locationData = position;
    controller.updateSymbol(controller.symbols.first, (controller.symbols.first).options.copyWith(
        SymbolOptions(geometry: LatLng(position.latitude, position.longitude))
    ));
    await callPlaceDetail();
  }

  initMap(){
    setPermission();
    MapmyIndiaAccountManager.setMapSDKKey(ACCESS_TOKEN);
    MapmyIndiaAccountManager.setRestAPIKey(REST_API_KEY);
    MapmyIndiaAccountManager.setAtlasClientId(ATLAS_CLIENT_ID);
    MapmyIndiaAccountManager.setAtlasClientSecret(ATLAS_CLIENT_SECRET);
  }
  //

  Future<void> callPlaceDetail() async {
    try{
      MapmyIndiaReverseGeocode reverseGeocode = MapmyIndiaReverseGeocode(location: locationData);
      reverseGeocode.callReverseGeocode().then((value) => {
        if(value?.results?.isNotEmpty ?? false){
          place = AddressModel(
            address: value?.results!.first.formattedAddress,
            city: value?.results!.first.city,
            pinCode: value?.results!.first.pincode,
            latitude: locationData.latitude,
            longitude: locationData.longitude,
          ),
        },
        update()
      });
    }catch(e){
      update();
    }
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
  }

}

class AddressModel{
  final String? city;
  final String? country;
  final String? state;
  final String? pinCode;
  final String? address;
  final double? latitude;
  final double? longitude;
  AddressModel({this.city,this.country,this.state,this.pinCode,this.address,this.latitude,this.longitude});
}