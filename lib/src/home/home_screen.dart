import 'package:flutter/material.dart';
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
