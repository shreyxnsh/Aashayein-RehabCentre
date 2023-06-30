

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rehabcentre/src/exceptions/signup_failure.dart';
import 'package:rehabcentre/src/features/screens/dashboard/dashboard.dart';
import 'package:rehabcentre/src/features/screens/login/login_screen.dart';
import 'package:rehabcentre/src/features/screens/mail_verification/mail_verification.dart';
import 'package:rehabcentre/src/features/screens/profile/profile_screen.dart';
import 'package:rehabcentre/src/features/screens/welcome/welcome_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    // function called whenever repo is ready
    firebaseUser = Rx<User?>(_auth.currentUser);
    // to get notified about any change in firebase
    firebaseUser.bindStream(_auth.userChanges());
    setInitialScreen(firebaseUser.value);
    ever(firebaseUser, setInitialScreen);
  }

  // this function will check if the user is authenticated, if yes it will redirect to Dashboard
  setInitialScreen(User? user) {
    user == null ? 
    Get.offAll(() => const WelcomeScreen()) 
    : user.emailVerified ? Get.offAll(() => Dashboard()) 
    : Get.offAll(() => MailVerification()) ;
  }

  Future<void> sendEmailVerification() async {
    try {
    await  _auth.currentUser?.sendEmailVerification();
} on FirebaseAuthException catch (e) {
  print(e);
  
  // TODO
}
    

  }

  Future<void> createUserWithEmailandPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      // FirebaseAuth.instance.currentUser.email 
      
    }catch(_){

    }
  }

  Future<void>  loginUserWithEmailandPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
          // if user is already validated, return to dashboard
          firebaseUser.value != null ? Get.offAll(() =>  Dashboard()) : Get.to(() => const WelcomeScreen());

    } on FirebaseAuthException catch (e) {
      final ex = SignupWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION -  ${ex.message}');
      throw ex;
    }catch(_){ 
      const ex = SignupWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;

    }
  }

  Future<void>  logout() async => 
  await _auth.signOut().then(( ProfileScreen) => LoginScreen())
  ;

  Future<void> phoneAuthentication(String phoneNo) async {

    // for making the queries run asynchronously write await keyword
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);

      }, 
      verificationFailed: (e){
         if(e.code == 'invalid-phone-number'){
          Get.snackbar('Error', 'The provided phone number is not valid.');
         } else{
          Get.snackbar("Error", "Something went wrong, try again.");
         }
      }, 
      codeSent: (verificationId, resendToken){
        this.verificationId.value = verificationId;
      }, 
      codeAutoRetrievalTimeout: (verificationId){
        this.verificationId.value = verificationId;
      }
      );

  }

  Future<bool> verifyOTP(String otp) async{
    var credentials = 
    await _auth.signInWithCredential(
      PhoneAuthProvider.
      credential(verificationId: this.verificationId.value, smsCode: otp));

      return credentials.user != null ? true : false;
  }
}
