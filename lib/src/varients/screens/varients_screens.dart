import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/src/varients/providers/varient_provider.dart';
import 'package:real_estate_app/src/varients/widgets/custom_dialog.dart';
import 'package:real_estate_app/style/colors.dart';

class VarientScreen extends StatefulWidget {
  const VarientScreen({super.key});

  @override
  _VarientScreenState createState() => _VarientScreenState();
}

class _VarientScreenState extends State<VarientScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    context.read<VariantProvider>().loadMapStyle();
    context.read<VariantProvider>().getMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VariantProvider>(builder: (context, varientState, child) {
      return Scaffold(
        body: Stack(
          children: [
            //Map starts
            GoogleMap(
              onMapCreated: varientState.onMapCreated,
              initialCameraPosition: CameraPosition(
                target: varientState.center,
                zoom: 12.0,
              ),
              myLocationButtonEnabled: false,
              markers: varientState.markers,
              style: varientState.mapStyle,
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
                      color: AppColors.iconColor,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'List of variants',
                      style: TextStyle(color: AppColors.iconColor, fontSize: 12),
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
                    onTapDown: (TapDownDetails details) {
                      showDialog(
                        context: context,
                        builder: (context) => CustomDialog(
                          tapPosition: details.globalPosition,
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration:
                          BoxDecoration(color: AppColors.ash.withOpacity(0.7), shape: BoxShape.circle),
                      child: const Icon(
                        Icons.expand_outlined,
                        color: AppColors.iconColor,
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
                      color: AppColors.iconColor,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
