import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();
  //esfse

  // text field controllers to get data from the textfields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  // function to register user from the design
  void registerUser(String email, String password){
    // function with firebase logic, user input data has been collected


  }

}