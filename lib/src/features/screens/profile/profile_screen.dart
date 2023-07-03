import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:rehabcentre/src/constants/image_strings.dart';
import 'package:rehabcentre/src/constants/text_strings.dart';
import 'package:rehabcentre/src/constants/sizes.dart';
import 'package:rehabcentre/src/features/screens/login/login_screen.dart';
import 'package:rehabcentre/src/repositories/authentication_repository.dart';
import 'package:rehabcentre/src/features/screens/profile/update_profile_screen.dart';

import '../../../constants/colors.dart';
import '../../../utils/rehabcentre.dart';
import '../../controllers/profile_controller.dart';
import '../../models/user_model.dart';

class ProfileScreen extends StatelessWidget {

  static UserModal? userData;

  ProfileScreen({super.key});

  final authRepo = Get.put(AuthenticationRepository());
        FirebaseFirestore db =  FirebaseFirestore.instance;

                      var uid =  FirebaseAuth.instance.currentUser!.uid;
                      var details =  FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            // go to the previous screen
            Get.back();
          },
          icon: Icon(
            LineAwesomeIcons.angle_left,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Profile",
          style: TextStyle(
            fontFamily: 'PoppinsBold',
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(tDefaultSize),
            child: FutureBuilder(
              future: controller.getUserData(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.done){
                  if(snapshot.hasData){
                    UserModal userData = snapshot.data as UserModal;
                    return Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image(image: AssetImage(tProfileImage))),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: (){},
                          child: Container(
                            width: 35,
                            height: 35, 
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: tPrimaryColor,
                            ),
                            child: Icon(
                              LineAwesomeIcons.alternate_pen,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),    
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${userData.fullname}",
                    style: TextStyle(
                      fontFamily: 'PoppinsBold',
                      fontSize: 18,
                    ),
                  ),
            
                  Text(
                    "${userData.email}",
                    style: TextStyle(
                      fontFamily: 'PoppinsMedium',
                      fontSize: 15,
                    ),
                  ),
            
                  SizedBox(
                    height: 20,
                  ),
            
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => UpdateProfileScreen());
                        },
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontFamily: 'PoppinsBold',
                            color: tDarkColor,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          shape: StadiumBorder(),
                          foregroundColor: tWhiteColor,
                          backgroundColor: tPrimaryColor,
                          padding: EdgeInsets.symmetric(vertical: tButtonHeight),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  // menu
                  ProfileMenuWidget(
                    title: 'Settings',
                    icon: LineAwesomeIcons.cog,
                    onPress: () async {
                      // add data in firestore
                      // log('click');
                      // int varr = 1;
                      // for (var i in rehabData) {
                      //   await db.collection("RehabCentre").add(i);
                      //   log((varr++).toString());
                      // }
                      // log("done dana done !!");
                    },
                  ),
                  ProfileMenuWidget(
                    title: 'Billing Details',
                    icon: LineAwesomeIcons.wallet,
                    onPress: () {},
                  ),
                  ProfileMenuWidget(
                    title: 'User management',
                    icon: LineAwesomeIcons.user_check,
                    onPress: () {},
                  ),
            
                  const Divider(
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ProfileMenuWidget(
                    title: 'Information',
                    icon: LineAwesomeIcons.info,
                    onPress: () {},
                  ),
            
                  ProfileMenuWidget(
                    title: 'Logout',
                    textColor: Colors.red,
                    icon: LineAwesomeIcons.alternate_sign_out,
                    onPress: () async {
                      FirebaseAuth _auth = await FirebaseAuth.instance;
                await _auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
                    },
                    endIcon: false,
                  ),
                ],
              );
                  }else if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()),);
                  } else{
                    return Center(child: Text("Something went wrong"),);
                  }
                  
                  } else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                
              } // builder
              
            )),
      ),
    ));
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: tAccentColor.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: tAccentColor,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: 'PoppinsMedium', fontSize: 16, color: textColor),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Icon(
                LineAwesomeIcons.angle_right,
                size: 18,
                color: Colors.grey,
              ),
            )
          : null,
    );
  }
}
