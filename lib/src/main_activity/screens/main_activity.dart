import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/src/favorite/screens/favorite_screen.dart';
import 'package:real_estate_app/src/home/screens/home_screen.dart';
import 'package:real_estate_app/src/main_activity/providers/nav_provider.dart';
import 'package:real_estate_app/src/main_activity/widgets/custom_nav_bar.dart';
import 'package:real_estate_app/src/message/screens/message_screens.dart';
import 'package:real_estate_app/src/profile/screens/profile_screens.dart';
import 'package:real_estate_app/src/varients/screens/varients_screens.dart';

class MainActivityScreen extends StatefulWidget {
  const MainActivityScreen({super.key});

  @override
  State<MainActivityScreen> createState() => _MainActivityScreenState();
}

class _MainActivityScreenState extends State<MainActivityScreen> {
  ///navigation body items
  final _navBodyItems = [
    const VarientScreen(),
    const MessageScreen(),
    const HomeScreen(),
    const FavoriteScreen(),
    const ProfileScreens()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavProvider>(
      builder: (context, navState, child) {
        return Scaffold(
          body: _navBodyItems[navState.navIndex],
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const CustomBottomNavigationBar(),
        );
      },
    );
  }
}
