import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_app/src/main_activity/screens/main_activity.dart';
import 'package:real_estate_app/src/main_activity/providers/nav_provider.dart';
import 'package:real_estate_app/src/varients/providers/varient_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavProvider()),
        ChangeNotifierProvider(create: (context) => VariantProvider())
      ],
      child: const MaterialApp(
        home: MainActivityScreen(),
      ),
    );
  }
}
