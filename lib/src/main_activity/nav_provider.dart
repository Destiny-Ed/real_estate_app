import 'package:flutter/material.dart';

class NavProvider extends ChangeNotifier {
  int _navIndex = 0;
  int get navIndex => _navIndex;
  set setNavIndex(int navIndex) {
    _navIndex = navIndex;
    notifyListeners();
  }
}
