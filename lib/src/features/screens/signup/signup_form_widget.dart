import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class SignupFormWidget extends StatelessWidget {
  const SignupFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: const EdgeInsets.symmetric(vertical: 20),
     child: Form(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           TextFormField(
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
                   
           onPressed: (){}, 
           child: Text('Signup'.toUpperCase(), style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: 14),),
           ),
       ),
           

         ],
       )
     ),
    );
  }
}