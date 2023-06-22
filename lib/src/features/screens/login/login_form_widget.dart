import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rehabcentre/src/constants/sizes.dart';
import 'package:rehabcentre/src/features/screens/dashboard/dashboard.dart';
import 'package:rehabcentre/src/features/screens/login/login_screen.dart';

import '../../../constants/colors.dart';
import '../forgot_password/forgot_password_options/forgot_password_bottomsheet.dart';
import '../forgot_password/forgot_password_options/forgot_password_sheet_widget.dart';

class LoginForm extends StatelessWidget {
  LoginForm({super.key});

  // controllers to take user input into a string and check w the database
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    FocusNode _focusNode = FocusNode();

    return Form(
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.symmetric(vertical: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              // controller takes the user input to check with the database
              controller: _emailController,
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person_outline_outlined,
                    color: tSecondaryColor,
                  ),
                  labelText: 'Email',
                  hintText: 'Email',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: tSecondaryColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2.0, color: tSecondaryColor))),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              // controller takes the user input to check with the database
              controller: _passwordController,
              focusNode: _focusNode,
              
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.fingerprint,
                    color: tSecondaryColor,
                  ),
                  labelText: 'Password',
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: tSecondaryColor),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2.0, color: tSecondaryColor)),
                  suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.remove_red_eye_sharp),
                  )),
            ),
            SizedBox(
              height: 10.0,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      ForgotPasswordScreen.buildShowModalBottomSheet(context);
                    },
                    child: Text('Forgot password ?'))),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 20, left: 20, right: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        tSecondaryColor), // Change the button color here
                  ),
                  onPressed: () async {
                    _focusNode.requestFocus();
                    final email = _emailController.text;
                    final password = _passwordController.text;
                    try {
                      final userCredential =
                          await _auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );

                      if (userCredential.user != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Dashboard()),
                        );
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text(
                    'Login'.toUpperCase(),
                    style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: 14),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
