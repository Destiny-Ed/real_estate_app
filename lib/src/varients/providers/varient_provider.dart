import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/shared/utils/get_assets_source.dart';

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

  final _locations = <LatLng>[
    const LatLng(59.94, 30.32),
    const LatLng(59.92, 30.34),
    const LatLng(59.89, 30.36),
    const LatLng(59.90, 30.30),
    const LatLng(59.96, 30.30),
    const LatLng(59.89, 30.31),
  ];

  Set<Marker> markers = {};

  void getMarkers() async {
    final icon = BitmapDescriptor.fromBytes(await getBytesFromAsset("assets/icons/place_icon.png", 150));
    for (var i = 0; i < _locations.length; i++) {
      final location = _locations[i];

      // Check if location already exists

      final locationExists = markers
          .firstWhere((element) => element.markerId.value == i.toString(),
              orElse: () => const Marker(markerId: MarkerId("")))
          .markerId
          .value;

      if (locationExists == '') {
        markers.add(Marker(markerId: MarkerId(i.toString()), position: location, icon: icon));
      }
      notifyListeners();
    }
  }

  // final Set<Marker> markers = {
  //   Marker(
  //     markerId: const MarkerId('1'),
  //     position: const LatLng(59.94, 30.32),
  //     icon: BitmapDescriptor.fromBytes(getBytesFromAsset(icon, 85)),
  //   ),
  //   Marker(
  //     markerId: const MarkerId('2'),
  //     position: const LatLng(59.92, 30.34),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  //   ),
  //   Marker(
  //     markerId: const MarkerId('3'),
  //     position: const LatLng(59.89, 30.36),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  //   ),
  //   Marker(
  //     markerId: const MarkerId('4'),
  //     position: const LatLng(59.90, 30.30),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  //   ),
  //   Marker(
  //     markerId: const MarkerId('5'),
  //     position: const LatLng(59.96, 30.30),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  //   ),
  //   Marker(
  //     markerId: const MarkerId('5'),
  //     position: const LatLng(59.89, 30.31),
  //     icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  //   ),
  // };
}
