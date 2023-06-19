import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rehabcentre/src/features/screens/welcome/welcome_screen.dart';

class SplashScreenController extends GetxController{

  static SplashScreenController get find => Get.find();

  RxBool animate = false.obs;

  

Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    animate = true.obs;
    // navigate to welcome screen after 5 sec
    await Future.delayed(Duration(milliseconds: 5000));
    Get.to(WelcomeScreen());


  }
}
  