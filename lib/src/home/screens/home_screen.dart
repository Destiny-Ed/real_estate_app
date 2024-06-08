import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_app/config/constant.dart';
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
                          backgroundImage: CachedNetworkImageProvider(dummyIcon),
                        ),
                      ],
                    ),
                  ),

                  ///Top app bar area ends

                  const SizedBox(height: 20),

                  ///greetings section starts
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: const Text(
                      "Hi, Marina",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.grey),
                    ),
                  ),
                  const SizedBox(height: 5),
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: const Text(
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
                        SizedBox(width: 20),
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
                          imageUrl: 'image_one',
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
                                  imageUrl: 'image_two',
                                  address: 'Gladkova St., 25',
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  children: [
                                    PropertyCard(
                                      imageUrl: 'image_three',
                                      address: 'Gladkova St., 25',
                                    ),
                                    SizedBox(height: 10),
                                    Expanded(
                                      child: PropertyCard(
                                        imageUrl: 'image_four',
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
