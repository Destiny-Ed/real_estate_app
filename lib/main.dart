import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/src/main_activity/main_activity.dart';
import 'package:real_estate_app/src/main_activity/nav_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => NavProvider())],
      child: const MaterialApp(
        home: MainActivityScreen(),
      ),
    );
  }
}
