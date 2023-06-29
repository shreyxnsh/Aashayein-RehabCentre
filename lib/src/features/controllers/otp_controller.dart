import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:rehabcentre/src/features/screens/dashboard/dashboard.dart';
import 'package:rehabcentre/src/repositories/authentication_repository.dart';

class OTPController extends GetxController{
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async{
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll( Dashboard()) : Get.back();
    

  }
}