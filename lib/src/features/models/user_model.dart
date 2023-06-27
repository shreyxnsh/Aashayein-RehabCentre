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

}