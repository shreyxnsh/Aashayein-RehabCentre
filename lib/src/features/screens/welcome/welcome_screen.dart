import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:rehabcentre/src/constants/colors.dart';
import 'package:rehabcentre/src/constants/sizes.dart';
import 'package:rehabcentre/src/constants/text_strings.dart';
import 'package:rehabcentre/src/features/screens/login/login_screen.dart';
import 'package:rehabcentre/src/features/screens/signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage('assets/images/welcome-screen-image.png'), height: height *0.5,),
            Column(
              children: [
                Text(tWelcomeTitle, style: TextStyle(
                  fontFamily: 'PoppinsBold',
                  fontSize: 20,
                ),),
                SizedBox(
                  height: 10,
                ),
                Text(tWelcomeSubTitle, textAlign: TextAlign.center,
                style  : TextStyle(
                  fontFamily: 'PoppinsMedium',
                  fontSize: 16,
  
                ),),
              ],
            ),
            
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
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
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      foregroundColor: tSecondaryColor,
                      side: BorderSide(color: tSecondaryColor),
                      padding: EdgeInsets.symmetric(vertical: tButtonHeight)
                    ),
                    child: Text('Login'.toUpperCase()),
                    ),
                ),
                SizedBox(
                 width: 10.0,
                ),
                  Expanded(
                    child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return SignupScreen();
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
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      foregroundColor: tWhiteColor,
                      backgroundColor: tSecondaryColor,
                      side: BorderSide(color: tSecondaryColor),
                      padding: EdgeInsets.symmetric(vertical: tButtonHeight)
                    ),
                    child: Text('Signup'.toUpperCase()),
                    ),
                  ),
                  
              ],
            )
          ],
        ),
      ),
    );
  }
}