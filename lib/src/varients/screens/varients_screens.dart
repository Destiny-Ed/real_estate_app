import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:real_estate_app/style/colors.dart';

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

  String? _mapStyle;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _loadMapStyle() async {
    final String style = await rootBundle.loadString('assets/styles/map_style.json');

    _mapStyle = style;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Map starts
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 12.0,
            ),
            markers: _markers,
            style: _mapStyle,
          ),
          //Map ends

          ///Search and filter field starts
          Positioned(
            top: 60.0,
            left: 35.0,
            right: 35.0,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 5),
                          child: Icon(
                            Icons.search,
                            size: 20,
                          ),
                        ),
                        Text(
                          'Saint Petersburg',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.candlestick_chart,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),

          ///Search and filter field ends
          ///

          //additional buttons

          Positioned(
            bottom: MediaQuery.of(context).size.height / 6.5,
            right: 35.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: AppColors.ash.withOpacity(0.7),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: const Row(
                children: [
                  Icon(
                    Icons.format_align_left_rounded,
                    size: 16,
                    color: AppColors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'List of variants',
                    style: TextStyle(color: AppColors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ),

          ///left action buttons
          Positioned(
            bottom: MediaQuery.of(context).size.height / 6.5,
            left: 35.0,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    _showMenu(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: AppColors.ash.withOpacity(0.7), shape: BoxShape.circle),
                    child: const Icon(
                      Icons.expand_outlined,
                      color: AppColors.white,
                      size: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: AppColors.ash.withOpacity(0.7), shape: BoxShape.circle),
                  child: const Icon(
                    Icons.send,
                    color: AppColors.white,
                    size: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _showMenu(BuildContext context) {
  final RenderBox button = context.findRenderObject() as RenderBox;
  final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  final RelativeRect position = RelativeRect.fromLTRB(
    15.0, // left
    overlay.size.height - 20.0 - button.size.height, // top (bottom left)
    overlay.size.width - 15.0 - button.size.width, // right
    20.0, // bottom
  );

  showMenu<String>(
    context: context,
    position: position,
    items: <PopupMenuEntry<String>>[
      const PopupMenuItem<String>(
        value: 'Option 1',
        child: Text('Option 1'),
      ),
      const PopupMenuItem<String>(
        value: 'Option 2',
        child: Text('Option 2'),
      ),
      const PopupMenuItem<String>(
        value: 'Option 3',
        child: Text('Option 3'),
      ),
    ],
  ).then((String? value) {
    if (value != null) {
      // Handle menu item selection
    }
  });
}
