import 'package:flutter/material.dart';
import 'package:rehabcentre/src/features/screens/forgot_password/forgot_password_mail/forgot_password_mail.dart';

import '../../../../constants/sizes.dart';
import 'forgot_password_sheet_widget.dart';

class ForgotPasswordScreen{
  
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        context: context, builder: (context) => Container(
                        padding: EdgeInsets.all(tDefaultSize),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Make Selection', style: TextStyle(fontFamily: 'PoppinsBold', fontSize: 20),),
                            Text('Select one of the options give below to reset your password', style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: 14),),
                            SizedBox(
                              height: 30.0,
                            ),
                            ForgotpasswordBtnWidget(
                              btnIcon: Icons.mail_outline_rounded,
                              title: 'Email',
                              subtitle: 'Reset using E-mail verification',
                              onTap: (){
                                Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ForgotPasswordMailScreen()),);
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            ForgotpasswordBtnWidget(
                              btnIcon: Icons.phone_android_rounded,
                              title: 'Phone number',
                              subtitle: 'Reset using OTP verification',
                              onTap: (){

                              },
                            )
                          ],
                        ),
                      ),);
  }
}