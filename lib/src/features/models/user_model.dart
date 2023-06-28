import 'package:cloud_firestore/cloud_firestore.dart';

class UserModal{
  final String? id;
  final String fullname;
  final String email;
  final String phoneNo;
  final String password;

  // model constructor
  const UserModal({
    this.id,
    required this.email,
    required this.phoneNo,
    required this.password,
    required this.fullname,
  });

  // function to convert data into json format for firestore
  toJson(){
    return {
      "FullName" : fullname,
      "Email" : email,
      "Phone" : phoneNo,
      "Password" : password,
    };
  }

  // map user fetched from firebase to user model
  factory UserModal.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){

    final data = document.data()!;


    return UserModal(
      id: document.id,
      email: data["Email"], 
      phoneNo: data["Phone"], 
      password: data["Password"], 
      fullname: data["FullName"],
      );
  }


}