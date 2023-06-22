import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../repositories/authentication_repository.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();
  //esfse

  // text field controllers to get data from the textfields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  get phoneAuthentication => null;

  // function to register user from the design
  void registerUser(String email, String password){
    // function with firebase logic, user input data has been collected
    AuthenticationRepository.instance.createUserWithEmailandPassword(email, password);
  }
  void phoneAuth(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

}