import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:gsc/models/doctor_model.dart';
import 'package:gsc/utils/colors.dart';
import 'package:gsc/views/disease/recomendation_doctor_card.dart';

class DoctorMap extends StatefulWidget {
  const DoctorMap({
    Key? key,
    required this.dataDoctor,
  }) : super(key: key);

  final DoctorModel dataDoctor;

  @override
  State<DoctorMap> createState() => _DoctorMapState();
}

class _DoctorMapState extends State<DoctorMap> {
  bool? isIos;

  @override
  void initState() {
    if (Platform.isIOS) {
      isIos = true;
    }
    super.initState();
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      // bearing: 192.8334901395799,
      target: LatLng(-6.377576763519942, 106.83162018363835),
      // tilt: 59.440717697143555,
      zoom: 14);

  static const Marker _rsBundaMargonda = Marker(
    markerId: MarkerId("1"),
    infoWindow: InfoWindow(title: "RSU Bunda Margonda"),
    position: LatLng(-6.364940067121678, 106.83484805587089),
  );
  static const Marker _rsUniversitasIndonesia = Marker(
    markerId: MarkerId("2"),
    infoWindow: InfoWindow(title: "RS Universitas Indonesia"),
    position: LatLng(-6.372723619652904, 106.8296194806852),
  );
  static const Marker _rsMitraKeluarga = Marker(
    markerId: MarkerId("3"),
    infoWindow: InfoWindow(title: "RS Mitra Keluarga"),
    position: LatLng(-6.394156412420279, 106.82453855279957),
  );
  static const Marker _rsGrhaPermataIbu = Marker(
    markerId: MarkerId("4"),
    infoWindow: InfoWindow(title: "RS Graha Permata Ibu"),
    position: LatLng(-6.370069878608769, 106.81394761527515),
  );

  void changeMapMode(GoogleMapController mapController) {
    getJsonFile("assets/map_style.json")
        .then((value) => setMapStyle(value, mapController));
  }

  //helper function
  void setMapStyle(String mapStyle, GoogleMapController mapController) {
    mapController.setMapStyle(mapStyle);
  }

  //Get Json File
  Future<String> getJsonFile(String path) async {
    ByteData byte = await rootBundle.load(path);
    var list = byte.buffer.asUint8List(byte.offsetInBytes, byte.lengthInBytes);
    return utf8.decode(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: primary,
        title: const Text(
          "Maps",
        ),
      ),
      // backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              myLocationEnabled: true,
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              indoorViewEnabled: true,
              zoomControlsEnabled: false,
              onMapCreated: (GoogleMapController controller) {
                changeMapMode(controller);
                _controller.complete(controller);
              },
              markers: {
                _rsBundaMargonda,
                _rsUniversitasIndonesia,
                _rsMitraKeluarga,
                _rsGrhaPermataIbu
              },
            ),
          ),
          RecomendationDoctorCard(dataDoctor: widget.dataDoctor)
        ],
      ),
      floatingActionButton: Visibility(
        visible: !isIos!,
        child: FloatingActionButton.extended(
          onPressed: _goToTheLake,
          label: const Text('Current Location'),
          icon: const Icon(Icons.location_history),
        ),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
