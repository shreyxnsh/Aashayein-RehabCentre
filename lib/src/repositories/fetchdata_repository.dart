import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FetchingRepository extends GetxController {
  static FetchingRepository get instance => Get.find();

    final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;
    final _db = FirebaseFirestore.instance;


}