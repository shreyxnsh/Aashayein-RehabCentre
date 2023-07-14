import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentModal {
  final String username;
  final String centrename;
  final String category;
  final String contact;
  final String address;
  final String time;
  final String date;
  final String status;
  final String state;
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
    required this.state,
    required this.email,
  });

  // function to convert data into json format for firestore
  toJson() {
    return {
      "name": username,
      "centrename": centrename,
      "category": category,
      "contact": contact,
      "address": address,
      "time": time,
      "date": date,
      "status": status,
      "state": state,
      "email": email,
    };
  }

  // map user fetched from firebase to user model
  static getSnapshotViaEmail(String email) async {
    var data = await FirebaseFirestore.instance
        .collection("Appointments")
        .where("email", isEqualTo: email)
        .get();
    List appointments = [];
    data.docs.forEach((element) {
      appointments.add(element.data());
    });

    return appointments;
  }

  static AppointmentModal fromSnapshot(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;
    return AppointmentModal(
      username: data["username"] as String,
      centrename: data["centername"] as String,
      category: data["category"] as String,
      contact: data["contact"] as String,
      address: data["address"] as String,
      time: data["time"] as String,
      date: data["date"] as String,
      status: data["status"] as String,
      state: data["state"] as String,
      email: data["email"] as String,
    );
  }
}
