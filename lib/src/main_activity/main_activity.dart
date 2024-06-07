import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/src/main_activity/nav_provider.dart';

class MainActivityScreen extends StatefulWidget {
  const MainActivityScreen({super.key});

  @override
  State<MainActivityScreen> createState() => _MainActivityScreenState();
}

class _MainActivityScreenState extends State<MainActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NavProvider>(builder: (context, navState, child) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(items: items),
      );
    });
  }
}

final items = [
  const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
  const BottomNavigationBarItem(icon: Icon(Icons.message), label: 'message'),
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
  const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'favorite'),
  const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile')
];
