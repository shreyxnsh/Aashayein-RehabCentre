import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rehabcentre/src/constants/sizes.dart';
import 'package:rehabcentre/src/features/screens/forgot_password/forgot_password_otp/otp_screen.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';

class ForgotPasswordMailScreen extends StatelessWidget {
  const ForgotPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: tDefaultSize * 3,
                ),
                Center(child: Image(image: AssetImage(tForgotImage), height: size.height*0.3,)),
                Center(child: Text('Forgot password', style: TextStyle(fontFamily: 'PoppinsBold', fontSize: 24,),)),
                Text('Enter your registered e-mail address for verification.', textAlign: TextAlign.center, style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: 18, ),),
                SizedBox(
                  height: 20.0,
                ),
                Form(
                  child: Column(
                    children: [
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
               )
                    ],
                  )
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(  
           width: double.infinity,
           child: ElevatedButton(
             
             style: ButtonStyle(
             backgroundColor: MaterialStateProperty.all<Color>(tSecondaryColor), // Change the button color here
           ),
                     
             onPressed: (){
Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OTPScreen()),);

             }, 
             child: Text('Next'.toUpperCase(), style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: 14),),
             ),
         )
              ]
              ,)
        
          ),
        ),
    
      ),
    );
  }
}