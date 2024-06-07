import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:real_estate_app/src/home/widgets/custom_widgets.dart';
import 'package:real_estate_app/style/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF7f4ef),
              Color(0xFFF8eFe6),
              Color(0xFFF9d8af),
              Color(0xFFF7f4ef),
              Color(0xFFF7f4ef),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///Top app bar area starts
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10), color: AppColors.white),
                              padding: const EdgeInsets.all(10),
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: AppColors.grey,
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    "Saint Petersburg",
                                    style: TextStyle(
                                      color: AppColors.grey,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const CircleAvatar(
                          backgroundColor: AppColors.darkAmber,
                        ),
                      ],
                    ),
                  ),

                  ///Top app bar area ends

                  const SizedBox(height: 20),

                  ///greetings section starts
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "Hi, Marina",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.grey),
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      "let's select your\nperfect place",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  ///greetings section ends

                  ///offer cards starts
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OfferCard(
                          title: "buy",
                          offers: "1 034",
                          color: AppColors.darkAmber,
                          textColor: AppColors.white,
                          isRound: true,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        OfferCard(
                          title: "rent",
                          offers: "2 212",
                          color: AppColors.white,
                          textColor: AppColors.grey,
                        ),
                      ],
                    ),
                  ),

                  ///offer cards ends

                  const SizedBox(height: 20),

                  ///Property card starts
                  Container(
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))),
                    padding: const EdgeInsets.all(10),
                    child: const Column(
                      children: [
                        PropertyCard(
                          imageUrl:
                              'https://media.istockphoto.com/id/951950894/photo/grey-corner-couch-with-pillows-and-blankets-in-white-living-room-interior-with-windows-and.jpg?s=612x612&w=0&k=20&c=WAAynQPn3XY29g_3WOMwH8gdFaSILb-ck7hMt_g1RSQ=',
                          address: 'Gladkova St., 25',
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 400,
                          child: Row(
                            children: [
                              Expanded(
                                child: PropertyCard(
                                  height: 400,
                                  imageUrl:
                                      'https://media.istockphoto.com/id/957053734/photo/domestic-kitchen-interior.jpg?s=612x612&w=0&k=20&c=dundn0b7jCtlqQAli-wYq--zM2NcfFAVjrt--cLYG_g=',
                                  address: 'Gladkova St., 25',
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  children: [
                                    PropertyCard(
                                      imageUrl:
                                          'https://media.istockphoto.com/id/957053734/photo/domestic-kitchen-interior.jpg?s=612x612&w=0&k=20&c=dundn0b7jCtlqQAli-wYq--zM2NcfFAVjrt--cLYG_g=',
                                      address: 'Gladkova St., 25',
                                    ),
                                    SizedBox(height: 10),
                                    Expanded(
                                      child: PropertyCard(
                                        imageUrl:
                                            'https://media.istockphoto.com/id/1199241746/photo/dark-colorful-home-interior-with-retro-furniture-mexican-style-living-room.jpg?s=612x612&w=0&k=20&c=0Sk7OPzda12-2GpmpbKfUYc31NtXmPVMmWvlLAu4CE0=',
                                        address: 'Gladkova St., 25',
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
