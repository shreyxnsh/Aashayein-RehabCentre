import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rehabcentre/src/features/models/centre_model.dart';

class FetchingRepository extends GetxController {
  static FetchingRepository get instance => Get.find();

    final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;
    final _db = FirebaseFirestore.instance;


    // fetch single record of user data 
  Future<CentreModal> getAustismCentres(String email) async {

    // fetching the data of the users in snapshot variable
    // write collection name and attribute in where to find data accordingly
    final snapshot = await _db.collection("RehabCentre").where("category", isEqualTo: 'Austism').get();
    
    // convert snapshot to a list 
    final userData = snapshot.docs.map((e) => CentreModal.fromSnapshot(e)).single;
  
    return userData;
  }


}