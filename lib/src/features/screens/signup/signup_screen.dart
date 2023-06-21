import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rehabcentre/src/common_widgets/form_header_widget.dart';
import 'package:rehabcentre/src/constants/colors.dart';
import 'package:rehabcentre/src/constants/image_strings.dart';
import 'package:rehabcentre/src/features/screens/login/login_screen.dart';
import 'package:rehabcentre/src/features/screens/signup/signup_form_widget.dart';

import '../../../constants/sizes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),

          child: Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(bottom: tDefaultSize, left: tDefaultSize, right: tDefaultSize),
            child: Column(
              children: [
                FormHeader(
                  image: tLoginScreenImage,
                   title: 'Get on-board!', 
                   subtitle: 'Fill in the form below to access the application'
                   ),
                   SignupFormWidget(),
                   Column(
                    children: [
                      const Text('OR', style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: 18),),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(tSecondaryColor), // Change the text color here
  ),
                          icon: Image(image: AssetImage(tGoogleLogo), width: 20.0,),
                          onPressed: (){}
                        , label: Text('Signin with Google'.toUpperCase(), 
                        style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: 13
                        ),
                        
                        ),
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                        //   Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>  LoginScreen()),
                        // );

                        Navigator.push(
                          context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return LoginScreen();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  var begin = Offset(-1.0, 0.0);
                  var end = Offset.zero;
                  var tween = Tween(begin: begin, end: end);
                  var offsetAnimation = animation.drive(tween);
                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                    },
                    transitionDuration: Duration(milliseconds: 200),
              ),
                
                        );
              
                        }, 
                      child: const Text.rich(
                        TextSpan(
                          text: "Already have an account?",style: TextStyle(fontFamily: 'PoppinsMedium', color: tSecondaryColor),
                          children: [
                            TextSpan(text: ' Login',
                            style: TextStyle(fontFamily: 'PoppinsMedium', color: Colors.blue))
                          ]
                        )
                        
                        )
                        )
                    ],
                   )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

