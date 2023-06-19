import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rehabcentre/src/constants/image_strings.dart';
import 'package:rehabcentre/src/constants/sizes.dart';
import 'package:rehabcentre/src/constants/text_strings.dart';
import 'package:rehabcentre/src/features/screens/welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool animate = false;

  @override
  void initState() {
    // TODO: implement initState
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            AnimatedPositioned(
              top: animate ? 0 : -30,
              left: animate ? 0 : -30,
              child: 
              Container(
                height: 100,
                width: 100,
                child: Image(
                  image: AssetImage('assets/images/splash-screen-topimage.png'
                  )
                  )
                  ), 
            duration: Duration(milliseconds: 1600)),

            AnimatedPositioned(
              duration: const Duration(milliseconds: 1600),
              top: 120,
              left: animate ? tDefaultSize : -80,
              child: AnimatedOpacity(opacity: animate ? 1 : 0, 
              duration: Duration(milliseconds: 1600),
              
             
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tAppName, style: TextStyle(fontFamily: 'PoppinsBold', fontSize: 24)),
                  Text(tAppTagline, style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: 18)),
      
                ],
              ), 
              )
              ),
              Center(
                child: AnimatedPositioned(
                  duration: const Duration(milliseconds: 2400),
                  bottom: animate ? 100 : 0,
                  child : AnimatedOpacity(duration: const Duration(milliseconds: 2000), opacity: animate ? 1:0,
                  child: Container(
                    height: 300,
                    width: 300,
                          
                    child: 
                    Image(image: AssetImage('assets/images/splash-screen-image.png',),),
                  )
                ),
                )
              )
          ],
        ),
    );
  }
  
  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    // navigate to welcome screen after 5 sec
    await Future.delayed(Duration(milliseconds: 5000));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));


  }
}