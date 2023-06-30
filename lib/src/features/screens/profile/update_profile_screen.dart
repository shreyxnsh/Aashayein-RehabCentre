import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_native_splash/cli_commands.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:rehabcentre/src/constants/sizes.dart';
import 'package:rehabcentre/src/features/controllers/profile_controller.dart';
import 'package:rehabcentre/src/features/models/user_model.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';

class UpdateProfileScreen extends StatelessWidget {


  
  const UpdateProfileScreen({super.key});

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
          "Edit Profile",
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
            // future builder will get the data from user repo to ui
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
                              LineAwesomeIcons.camera,
                              size: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),    
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Form(child: 
                  Column(
                    children: [
                       TextFormField(
                        // initial data of user in the text form 
                        initialValue:  userData.fullname,
               decoration: const InputDecoration(
                 label: Text('Full Name'),
                 
                 border: OutlineInputBorder(),
                 prefixIcon: Icon(
                   LineAwesomeIcons.user,
                   color: tSecondaryColor,
                 ),
                 labelStyle: TextStyle(color: tSecondaryColor),
                 focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(width: 2.0, color: tSecondaryColor)
                 )
               ),
                       ),
                       SizedBox(
               height: 10.0,
                       ),
                       TextFormField(
              
                      initialValue:  userData.email,
               decoration: const InputDecoration(
                 label: Text('E-mail'),
                 
                 border: OutlineInputBorder(),
                 prefixIcon: Icon(
                   LineAwesomeIcons.envelope_1,
                   color: tSecondaryColor,
                 ),
                 labelStyle: TextStyle(color: tSecondaryColor),
                 focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(width: 2.0, color: tSecondaryColor)
                 )
               ),
                       ),
                       SizedBox(
               height: 10.0,
                       ),
                       TextFormField(
              
                      initialValue:  userData.phoneNo,
               decoration: const InputDecoration(
                 label: Text('Phone number'),
                 
                 border: OutlineInputBorder(),
                 prefixIcon: Icon(
                   LineAwesomeIcons.phone,
                   color: tSecondaryColor,
                 ),
                 labelStyle: TextStyle(color: tSecondaryColor),
                 focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(width: 2.0, color: tSecondaryColor)
                 )
               ),
                       ),
                       SizedBox(
               height: 10.0,
                       ),
                       TextFormField(
              
                      initialValue:  userData.password,
               decoration: const InputDecoration(
                 label: Text('Password'),
                 
                 border: OutlineInputBorder(),
                 prefixIcon: Icon(
                   Icons.fingerprint,
                   color: tSecondaryColor,
                 ),
                 labelStyle: TextStyle(color: tSecondaryColor),
                 focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(width: 2.0, color: tSecondaryColor)
                 )
               ),
                       ),
                       SizedBox(
               height: 30.0,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text.rich(
                          TextSpan(
                            text: "Joined ",style: TextStyle(fontFamily: 'PoppinsMedium', color: tSecondaryColor),
                            children: [
                              TextSpan(text: '22 November 2022',
                              style: TextStyle(fontFamily: 'PoppinsMedium', 
                              fontWeight: FontWeight.bold, color: tSecondaryColor ))
                            ]
                          )
                          
                          ),
                          ElevatedButton(
                            
            
                            onPressed: (){}, 
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent.withOpacity(0.1),
                            elevation: 0,
                            foregroundColor: Colors.red,
                            shape: StadiumBorder()
            
                            ),
                            
            
                            child: Text('Delete'))
            
                          ,
                    ],
                  )
                    ],
                  )
                  )
                ],
              );
                  } else if(snapshot.hasError){
                    return Center(child: Text(snapshot.error.toString()),);
                  } else{
                    return Center(child: Text("Something went wrong"),);
                  }
                }else{
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              
            ),
          ),
        ),
        
      )
      );
  }
}