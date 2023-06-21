import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:rehabcentre/src/exceptions/signup_failure.dart';
import 'package:rehabcentre/src/features/screens/dashboard/dashboard.dart';
import 'package:rehabcentre/src/features/screens/welcome/welcome_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    // function called whenever repo is ready
    firebaseUser = Rx<User?>(_auth.currentUser);
    // to get notified about any change in firebase
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  // this function will check if the user is authenticated, if yes it will redirect to Dashboard
  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => const WelcomeScreen()) : Get.offAll(() => Dashboard()) ;
  }

  Future<void> createUserWithEmailandPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      
    }catch(_){

    }
  }

  Future<void>  loginUserWithEmailandPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
          // if user is already validated, return to dashboard
          firebaseUser.value != null ? Get.offAll(() => const Dashboard()) : Get.to(() => const WelcomeScreen());

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

  Future<void>  logout() async => await _auth.signOut();
}
