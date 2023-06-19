import 'package:flutter/material.dart';
import 'package:rehabcentre/src/constants/colors.dart';
import 'package:rehabcentre/src/features/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        primaryColor: tPrimaryColor,

      ),
      home: SplashScreen(),
    );
  }
}
