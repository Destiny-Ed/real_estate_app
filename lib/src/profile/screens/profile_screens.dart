import 'package:flutter/material.dart';
import 'package:real_estate_app/style/colors.dart';

class ProfileScreens extends StatefulWidget {
  const ProfileScreens({super.key});

  @override
  State<ProfileScreens> createState() => _ProfileScreensState();
}

class _ProfileScreensState extends State<ProfileScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.white),
          child: const Row(
            children: [],
          ),
        ),
        actions: const [
          CircleAvatar(
            backgroundColor: AppColors.darkAmber,
          )
        ],
      ),
    );
  }
}
