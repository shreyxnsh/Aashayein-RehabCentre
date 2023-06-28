import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();

  final showPassword = false.obs;
  final email = TextEditingController();

}