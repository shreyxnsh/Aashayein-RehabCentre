import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rehabcentre/src/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage('assets/images/welcome-screen-image.png'),),
            Column(
              children: [
                Text(tWelcomeTitle),
                Text(tWelcomeSubTitle),
              ],
            ),
            
            Row(
              children: [
                OutlinedButton(
                  onPressed: (){}, 
                  child: Text('Login'),
                  ),
                  ElevatedButton(
                  onPressed: (){}, 
                  child: Text('Signup'),
                  ),
                  
              ],
            )
          ],
        ),
      ),
    );
  }
}