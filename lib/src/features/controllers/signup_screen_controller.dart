import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rehabcentre/src/features/models/user_model.dart';
import 'package:rehabcentre/src/features/screens/forgot_password/forgot_password_otp/otp_screen.dart';
import 'package:rehabcentre/src/repositories/user_repository.dart';

import '../../repositories/authentication_repository.dart';

class SignUpController extends GetxController{
  static SignUpController get instance => Get.find();
  //esfse

  // text field controllers to get data from the textfields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  get phoneAuthentication => null;

  // function to register user from the design
  void registerUser(String email, String password){
    // function with firebase logic, user input data has been collected
    AuthenticationRepository.instance.createUserWithEmailandPassword(email, password);
  }

  // setting the data in the user modal
  Future<void> createUser(UserModal user) async {
    // store data in modal
    await userRepo.createUser(user);
    // authenticate user
    phoneAuth(user.phoneNo);

    // email auth
    
    // redirect to otp screen
    Get.to(() => OTPScreen());
  }
  void phoneAuth(String phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

}