import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:rehabcentre/src/constants/sizes.dart';
import 'package:rehabcentre/src/constants/text_strings.dart';

import '../../../../constants/colors.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text(tOtpTitle, style: TextStyle(fontFamily: 'PoppinsBold', fontSize: 60), ),
               Text(tOtpSubTitle.toUpperCase(), style: TextStyle(fontFamily: 'PoppinsBold', fontSize: 20) ),
               SizedBox(
                height: 30,
               ),
               Text(tOtpMessgae + "\nshreyanshatwork@gmail.com", textAlign: TextAlign.center, style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: 16)),
               SizedBox(
                height: 20,
               ),
               OtpTextField(
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                keyboardType: TextInputType.number,
                onSubmit: (code){

                },
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
                  onPressed: (){},
                  child: Text('Next'.toUpperCase(), style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: 14),),),
                  
               )
            ]),
          ),
        ),
      ),
    );
  }
}