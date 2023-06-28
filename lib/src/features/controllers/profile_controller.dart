import 'package:get/get.dart';
import 'package:rehabcentre/src/repositories/authentication_repository.dart';
import 'package:rehabcentre/src/repositories/user_repository.dart';

class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  // get user email and pass to UserRepository to fetch user record.
  getUserData(){
     // we will use the firebaseUser variable created in authentication repository to fetch data
    final email = _authRepo.firebaseUser.value?.email;
    if(email != null){
      // get user details from user repository
      return _userRepo.getUserDetails(email);
    }else{
      Get.snackbar("Error", "Something went wrong");
    }

  }

}