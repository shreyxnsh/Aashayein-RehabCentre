import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rehabcentre/src/features/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  // this repo will contain all the operations like create, update, delete, getAllUsers

  final _db = FirebaseFirestore.instance;

  createUser(UserModal user) async {
    await  _db.collection("Users").add(user.toJson()).whenComplete(() => 
    Get.snackbar(
      "Success",
      "Your account has been created!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green,
      )
      )
      .catchError((error,stackTrace){
        Get.snackbar(
      "Error",
      "Something went wrong, try again.",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent.withOpacity(0.1),
      colorText: Colors.red,
      );
      print(error.toString());
      })
      
      ;
  }
}