import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapmyindia_gl/mapmyindia_gl.dart';
import 'logic.dart';

class MapPage extends GetView<MapLogic> {
  final Function(AddressModel address)? callback;
  const MapPage({Key? key,this.callback}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    controller.initMap();
    return Scaffold(
      appBar: AppBar(title: const Text("Map"),),
      body: GetBuilder<MapLogic>(
        assignId: true,
        builder: (logic) {
          return Stack(
            children: [

              MapmyIndiaMap(
                initialCameraPosition: CameraPosition(
                  target: controller.locationData,
                  zoom: 14.0,
                ),
                onMapCreated: (MapmyIndiaMapController mapController) {
                  controller.controller = mapController;
                },
                onStyleLoadedCallback: () {
                  controller.addMarker();
                },
                onMapClick: (point, latLng) {
                  controller.updateMarkerPosition(latLng);
                },
              ),

              /// Select
              if(logic.place != null)
                Positioned(
                  bottom: 10,
                  left: 15,
                  right: 15,
                  child: Container(
                    color: Colors.black54,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Text(logic.place!.address!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold

                          ),),

                        const SizedBox(height: 10,),

                        SizedBox(
                          height: 25,
                          child: ElevatedButton(onPressed: () {
                            if(callback != null){
                              callback!(logic.place!);
                            }
                            Navigator.pop(context);
                          },
                              child: const Text("Use Address",
                                style: TextStyle(fontSize: 10),)),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
