import 'dart:convert';

class SignupWithEmailAndPasswordFailure{
  final String message;

  const SignupWithEmailAndPasswordFailure([this.message = "An unknown error occured"]);

  factory SignupWithEmailAndPasswordFailure.code(String code){
    switch(code){
      case 'weak-password' :
       return SignupWithEmailAndPasswordFailure('Please enter a strong password ');
       
      case 'invalid-email' :
       return SignupWithEmailAndPasswordFailure('E-mail is not valid or badly formatted ');
       
      case 'email-already-in-use' :
       return SignupWithEmailAndPasswordFailure('An account already exists for this e-mail');
       
      case 'operation-not-allowed' :
       return SignupWithEmailAndPasswordFailure('Operation is not allowed, please contact support');
       
      case 'user-disabled' :
       return SignupWithEmailAndPasswordFailure('This user is disabled. Please contact support for help');
       



      default : return SignupWithEmailAndPasswordFailure(); 
    }
  }
}