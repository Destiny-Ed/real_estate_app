import 'package:flutter/material.dart';
import 'package:real_estate_app/style/colors.dart';

class VarientScreen extends StatefulWidget {
  const VarientScreen({super.key});

  @override
  State<VarientScreen> createState() => _VarientScreenState();
}

class _VarientScreenState extends State<VarientScreen> {
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
