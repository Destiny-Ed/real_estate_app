import 'package:flutter/material.dart';

class NavProvider extends ChangeNotifier {
  int _navIndex = 2;
  int get navIndex => _navIndex;
  set setNavIndex(int navIndex) {
    _navIndex = navIndex;
    notifyListeners();
  }

  List<IconData> navItems = [
    Icons.search,
    Icons.chat_bubble_outline,
    Icons.home,
    Icons.favorite_border,
    Icons.person_outline
  ];
}
