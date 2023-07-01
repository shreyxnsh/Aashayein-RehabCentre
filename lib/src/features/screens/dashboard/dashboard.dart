import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:rehabcentre/src/constants/colors.dart';
import 'package:rehabcentre/src/constants/image_strings.dart';
import 'package:rehabcentre/src/features/screens/categories/AutismScreen.dart';
import 'package:rehabcentre/src/features/screens/categories/LearningScreen.dart';
import 'package:rehabcentre/src/features/screens/categories/SpeechScreen.dart';

import 'package:rehabcentre/src/features/screens/profile/profile_screen.dart';
import 'package:rehabcentre/src/utils/DummyScreen.dart';
import 'package:rehabcentre/src/utils/rehabcentre.dart';

import '../../../repositories/authentication_repository.dart';
import '../../controllers/profile_controller.dart';
import '../../models/user_model.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final authRepo = Get.put(AuthenticationRepository());

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: Text(
            'Aashayein',
            style: TextStyle(
              fontFamily: 'PoppinsBold',
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: tCardBgColor,
              ),
              child: IconButton(
                  onPressed: () {
                    Get.to(() => ProfileScreen());
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  )),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder<UserModal>(
                    future: controller.getUserData(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          UserModal userData = snapshot.data as UserModal;

                          return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Hello, ",
                                  style: TextStyle(
                                      fontFamily: 'PoppinsMedium',
                                      fontSize: 20),
                                ),
                                Text(
                                  "${userData.fullname}",
                                  style: TextStyle(
                                      fontFamily: 'PoppinsBold', fontSize: 20),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                              ]);
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        } else {
                          return Center(
                            child: Text("Something went wrong"),
                          );
                        }
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                     
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Categories',
                        style:
                            TextStyle(fontFamily: 'PoppinsBold', fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    // now create a list view which will be horizontally scrollable with 4 cards with icons title and subtitle and it should have on tap function too to navigate to different screens
                    SizedBox(
                      height: 120,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(() => AutismScreen());
                            },
                            child: Container(
                              width: 170,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: tCardBgColor,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(tAustismImage,height: 30,width: 30,),
                                  Text(
                                    "Autism",
                                    style: TextStyle(
                                        fontFamily: 'PoppinsMedium',
                                        fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => SpeechScreen());
                            },
                            child: Container(
                              width: 170,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: tCardBgColor,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [

                                  Image.asset(tSpeechImage,height: 30,width: 30,),
                                  Text(
                                    "Speech",
                                    style: TextStyle(
                                        fontFamily: 'PoppinsMedium',
                                        fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(() => LearningScreen());
                            },
                            child: Container(
                              width: 170,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: tCardBgColor,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [

                                  Image.asset(tLearningImage,height: 30,width: 30,),
                                  Text(
                                    "Learning Disability",
                                    style: TextStyle(
                                        fontFamily: 'PoppinsMedium',
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Recent Activities',
                        style:
                            TextStyle(fontFamily: 'PoppinsBold', fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),


                  ],
                ),
                

               
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
