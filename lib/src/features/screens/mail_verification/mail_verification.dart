import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:rehabcentre/src/features/controllers/mail_controller.dart';
import 'package:rehabcentre/src/repositories/authentication_repository.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(MailController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.only(top: 100, left: 20, right: 20, bottom: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(LineAwesomeIcons.envelope_open, size: 100,),
            SizedBox(
              height: 20,
            ),
            Text(
              "E-mail verification",
              style: TextStyle(
                fontFamily: 'PoppinsBold',
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Press Continue if you have verified your email.',
                style: TextStyle(
                  fontFamily: 'PoppinsBold',
                  fontSize: 14,
                ),
               
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              child: OutlinedButton(
                onPressed: () => controller.manuallyCheckVerificationStatus(),
                child: Text('Continue')
                
                ),


            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () => controller.sendVerificationEmail(), 
              child: Text('Reset E-mail Verification link')
              ),
              
            TextButton(
              onPressed: () => AuthenticationRepository.instance.logout(), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LineAwesomeIcons.alternate_long_arrow_left
                  ),
                    Text('Back'.tr.toLowerCase())
                  
                ],
              )
              ),
              
          ],
        ),
        ),
        
      ),
    );
  }
}