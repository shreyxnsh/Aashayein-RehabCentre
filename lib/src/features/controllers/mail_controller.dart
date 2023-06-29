import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rehabcentre/src/repositories/authentication_repository.dart';

class MailController extends GetxController{
  late Timer _timer;
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoRedirect();
  }
  
  Future<void> sendVerificationEmail() async {
    try{
        await AuthenticationRepository.instance.sendEmailVerification();
    }catch(e){
      GetSnackBar(
        title: 'Oh Snap,',
        message: e.toString(),
      );
    }
    
  }

  void setTimerForAutoRedirect() {  
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      // FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user!.emailVerified){
        timer.cancel();
        AuthenticationRepository.instance.setInitialScreen(user);
      }
     });

  // }



  }

  void manuallyCheckVerificationStatus() {
    FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if(user!.emailVerified){
        AuthenticationRepository.instance.setInitialScreen(user);
      }
  }

}