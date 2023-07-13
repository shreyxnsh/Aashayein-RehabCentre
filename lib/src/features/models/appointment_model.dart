import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModal{
  
  final String username;
  final String centrename;
  final String category;
  final String contact;
  final String address;
  final String time;
  final String date;
  final String status;
  final String email;

  // model constructor
  const AppointmentModal({
    required this.username,
    
    required this.category,
    required this.contact,
    required this.centrename,
    required this.address,
    required this.time,
    required this.date,
    required this.status,
    required this.email,

    
  });

  // function to convert data into json format for firestore
  toJson(){
    return {
      "name" : username,
      "centrename" : centrename,
      "category" : category,
      "contact" : contact,
      "address" : address,
      "time" : time,  
      "date" : date,
      "status" : status,
      "email" : email,

    };
  }

  // map user fetched from firebase to user model
  static getSnapshotViaEmail(String email)async {
    var data = await FirebaseFirestore.instance.collection("Appointments").where("email", isEqualTo: email).get();
    List appointments = [];
    data.docs.forEach((element) {
      appointments.add(element.data());
    
    });

    return appointments;
  }


}