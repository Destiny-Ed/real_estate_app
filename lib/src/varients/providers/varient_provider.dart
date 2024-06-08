import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VariantProvider extends ChangeNotifier {
  GoogleMapController? mapController;

  final LatLng center = const LatLng(59.9342802, 30.3350986); // Coordinates for Saint Petersburg

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  String? mapStyle;

  void loadMapStyle() async {
    final String style = await rootBundle.loadString('assets/styles/map_style.json');
    mapStyle = style;
    notifyListeners();
  }

  final Set<Marker> markers = {
    Marker(
      markerId: const MarkerId('1'),
      position: const LatLng(59.94, 30.32),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
    Marker(
      markerId: const MarkerId('2'),
      position: const LatLng(59.92, 30.34),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
    Marker(
      markerId: const MarkerId('3'),
      position: const LatLng(59.89, 30.36),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
    Marker(
      markerId: const MarkerId('4'),
      position: const LatLng(59.90, 30.30),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
    Marker(
      markerId: const MarkerId('5'),
      position: const LatLng(59.96, 30.30),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
    Marker(
      markerId: const MarkerId('5'),
      position: const LatLng(59.89, 30.31),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    ),
  };
}
