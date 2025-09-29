import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kyc/core/constant/color.dart';

import '../../../ui/widgets/buttons/buttons.dart';
class Mapscreen extends StatefulWidget {
  const Mapscreen({super.key});

  @override
  State<Mapscreen> createState() => _MapscreenState();
}

class _MapscreenState extends State<Mapscreen> {
  GoogleMapController? controller;
  LatLng SelectedPosition = LatLng(8.1833, 77.4119);
@override
  void initState() {
  CurrentLocation();
    // TODO: implement initState
    super.initState();
  }
  Future <void> CurrentLocation() async {
    await _checkPermission();
    Position pos = await Geolocator.getCurrentPosition();
    setState(() {
      SelectedPosition = LatLng(pos.latitude, pos.longitude);
    });
    controller?.animateCamera(
      CameraUpdate.newLatLng(SelectedPosition),
    );
  }

  Future<void> _checkPermission() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: SelectedPosition,
                zoom: 14,
              ),
              myLocationEnabled: true,
              onMapCreated: (mapController) {
                controller = mapController;
              },

              onTap: (LatLng position) {
                setState(() {
                  SelectedPosition = position;
                  // Navigator.pop(context, SelectedPosition); // ✅ returns LatLng
                });
              },
              markers: {
                Marker(markerId: MarkerId('Selected'),
                  position: SelectedPosition,


                ),
              },
            ),
            Positioned(
                bottom:5,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                                children: [
                  Expanded(
                    child: PrimaryButton(text: 'Current location', onPressed: () async{
                      await CurrentLocation();

                      // Navigator.pop(context, SelectedPosition);
                    },),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: PrimaryButton(text: 'Continue', onPressed: () {
                      Navigator.pop(context, SelectedPosition);
                    },

                    ),
                  ),

                                ],
                              ),
                ))
          ],
        ),
      ),
    );
  }
}
