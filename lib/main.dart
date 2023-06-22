import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:rehabcentre/src/constants/colors.dart';
import 'package:rehabcentre/src/features/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rehabcentre/src/repositories/authentication_repository.dart';
import 'firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData(
        primaryColor: tPrimaryColor,

      ),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRight,
      transitionDuration: Duration(milliseconds: 500),
      home: CircularProgressIndicator(
        
      ),
    );
  }
}
