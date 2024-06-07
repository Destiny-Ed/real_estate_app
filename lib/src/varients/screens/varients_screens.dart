import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VarientScreen extends StatefulWidget {
  const VarientScreen({super.key});

  @override
  _VarientScreenState createState() => _VarientScreenState();
}

class _VarientScreenState extends State<VarientScreen> {
  GoogleMapController? mapController;

  final LatLng _center = const LatLng(59.9342802, 30.3350986); // Coordinates for Saint Petersburg
  final Set<Marker> _markers = {
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
    // Add more markers here
  };

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 12.0,
            ),
            markers: _markers,
          ),
          Positioned(
            top: 40.0,
            left: 15.0,
            right: 15.0,
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Saint Petersburg',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_list),
                    onPressed: () {
                      // Handle filter button press
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 15.0,
            right: 15.0,
            child: ElevatedButton(
              onPressed: () {
                // Handle button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.7), // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: Text('List of variants', style: TextStyle(color: Colors.white, fontSize: 18.0)),
              ),
            ),
          ),
          Positioned(
            bottom: 90.0,
            left: 15.0,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.white,
              child: const Icon(Icons.layers, color: Colors.black),
            ),
          ),
          Positioned(
            bottom: 160.0,
            left: 15.0,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.white,
              child: const Icon(Icons.location_searching, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
