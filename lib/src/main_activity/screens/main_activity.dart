import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/src/main_activity/providers/nav_provider.dart';
import 'package:real_estate_app/src/main_activity/widgets/custom_nav_bar.dart';

class MainActivityScreen extends StatefulWidget {
  const MainActivityScreen({super.key});

  @override
  State<MainActivityScreen> createState() => _MainActivityScreenState();
}

class _MainActivityScreenState extends State<MainActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NavProvider>(
      builder: (context, navState, child) {
        return const Scaffold(
          bottomNavigationBar: SafeArea(
            child: CustomBottomNavigationBar(),
          ),
        );
      },
    );
  }
}
