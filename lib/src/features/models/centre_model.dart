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
  factory CentreModal.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){

    final data = document.data()!;


    return CentreModal(
      id: document.id,
      state: data["state"], 
      category: data["category"], 
      contact: data["contact"], 
      name: data["name"],
      address: data["address"],
      about: data["about"],
      );
  }


}