import 'package:flutter/material.dart';
import 'package:real_estate_app/style/colors.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
