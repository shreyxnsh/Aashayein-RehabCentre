import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rehabcentre/src/features/controllers/signup_screen_controller.dart';
import 'package:rehabcentre/src/features/screens/forgot_password/forgot_password_otp/otp_screen.dart';



import '../../../constants/colors.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    final _formKey = GlobalKey<FormState>();

    return Container(
     padding: const EdgeInsets.symmetric(vertical: 20),
     child: Form(
      key: _formKey,
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           TextFormField(
            controller: controller.fullName,
             decoration: const InputDecoration(
               label: Text('Full Name'),
               border: OutlineInputBorder(),
               prefixIcon: Icon(
                 Icons.person_outline_rounded,
                 color: tSecondaryColor,
               ),
               labelStyle: TextStyle(color: tSecondaryColor),
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(width: 2.0, color: tSecondaryColor)
               )
             ),
           ),
           SizedBox(
             height: 10.0,
           ),

           TextFormField(
            controller: controller.email,
          
             decoration: const InputDecoration(
               label: Text('E-mail'),
               
               border: OutlineInputBorder(),
               prefixIcon: Icon(
                 Icons.email_outlined,
                 color: tSecondaryColor,
               ),
               labelStyle: TextStyle(color: tSecondaryColor),
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(width: 2.0, color: tSecondaryColor)
               )
             ),
           ),
           SizedBox(
             height: 10.0,
           ),


           TextFormField(
            controller: controller.phoneNo,
             decoration: const InputDecoration(
               label: Text('Phone Number'),
               border: OutlineInputBorder(),
               prefixIcon: Icon(
                 Icons.numbers,
                 color: tSecondaryColor,
               ),
               labelStyle: TextStyle(color: tSecondaryColor),
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(width: 2.0, color: tSecondaryColor)
               )
             ),
           ),
           SizedBox(
             height: 10.0,
           ),



           TextFormField(
            controller: controller.password,
             decoration: const InputDecoration(
               label: Text('Password'),
               border: OutlineInputBorder(),
               prefixIcon: Icon(
                 Icons.fingerprint,
                 color: tSecondaryColor,
               ),
               labelStyle: TextStyle(color: tSecondaryColor),
               focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(width: 2.0, color: tSecondaryColor)
               )
             ),
           ),
           SizedBox(
             height: 10.0,
           ),
         SizedBox(  
         width: double.infinity,
         child: ElevatedButton(
          
           
           style: ButtonStyle(
           backgroundColor: MaterialStateProperty.all<Color>(tSecondaryColor), // Change the button color here
         ),
                   
           onPressed: (){
            if(_formKey.currentState!.validate()){
              // this assigns the user input to variables which will be sent to firebase
              // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
              SignUpController.instance.phoneAuth(controller.phoneNo.text.trim());
              Get.to(() => const OTPScreen());

            }
           }, 
           child: Text('Signup'.toUpperCase(), style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: 14),),
           ),
       ),
           

         ],
       )
     ),
    );
  }
}