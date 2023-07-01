import 'package:cloud_firestore/cloud_firestore.dart';

class CentreModal{
  final String? id;
  final String name;
  final String state;
  final String category;
  final String contact;
  final String address;
  final String about;

  // model constructor
  const CentreModal({
    this.id,
    required this.state,
    required this.category,
    required this.contact,
    required this.name,
    required this.address,
    required this.about,
  });

  // function to convert data into json format for firestore
  toJson(){
    return {
      "name" : name,
      "state" : state,
      "category" : category,
      "contact" : contact,
      "address" : address,
      "about" : about,
    };
  }

  // map user fetched from firebase to user model
  static CentreModal fromSnapshot(DocumentSnapshot document) {
  final data = document.data() as Map<String, dynamic>;
  return CentreModal(
    id: document.id,
    state: data["state"] as String,
    category: data["category"] as String,
    contact: data["contact"] as String,
    name: data["name"] as String,
    address: data["address"] as String,
    about: data["about"] as String,
  );
}


}