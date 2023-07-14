import 'dart:developer';

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
import 'package:rehabcentre/src/features/models/appointment_model.dart';
import 'package:rehabcentre/src/features/screens/categories/AppointmentScreen.dart';
import 'package:rehabcentre/src/features/screens/categories/AutismScreen.dart';
import 'package:rehabcentre/src/features/screens/categories/LearningScreen.dart';
import 'package:rehabcentre/src/features/screens/categories/SpeechScreen.dart';
import 'package:rehabcentre/src/features/screens/dashboard/widgets/category_card.dart';

import 'package:rehabcentre/src/features/screens/profile/profile_screen.dart';
import 'package:rehabcentre/src/utils/DummyScreen.dart';
import 'package:rehabcentre/src/utils/rehabcentre.dart';

import '../../../constants/sizes.dart';
import '../../../repositories/authentication_repository.dart';
import '../../controllers/profile_controller.dart';
import '../../models/user_model.dart';

class Dashboard extends StatelessWidget {
  Dashboard({super.key});

  final authRepo = Get.put(AuthenticationRepository());
  var details = FirebaseAuth.instance.currentUser;
  final auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

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
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Disabilities',
                        style:
                            TextStyle(fontFamily: 'PoppinsBold', fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    // now create a list view which will be horizontally scrollable with 4 cards with icons title and subtitle and it should have on tap function too to navigate to different screens
                    CategoryCard(),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Customer Support',
                        style:
                            TextStyle(fontFamily: 'PoppinsBold', fontSize: 18),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        width: 200,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.snackbar("Chat support",
                                  "Chat support will be available soon",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.yellow.shade400,
                                  colorText: tDarkColor,
                                  margin: EdgeInsets.all(16),
                                  borderRadius: 8,
                                  duration: Duration(seconds: 3),
                                  titleText: Text(
                                    'Chat support will be available soon',
                                    style: TextStyle(
                                      fontFamily: 'PoppinsBold',
                                      fontSize: 14,
                                      color: Colors.black,
                                      // Add any other desired text styles
                                    ),
                                  ),
                                  messageText: Text(
                                    'Until then you can contact us via email',
                                    style: TextStyle(
                                      fontFamily: 'PoppinsMedium',
                                      fontSize: 12,
                                      color: Colors.black,
                                      // Add any other desired text styles
                                    ),
                                  ));
                            },
                            // i want a leading icon in this elevated button

                            child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.chat,
                                    color: tDarkColor,
                                  ),
                                  Text(
                                    'Chat with us',
                                    style: TextStyle(
                                      fontFamily: 'PoppinsBold',
                                      color: tDarkColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              shape: StadiumBorder(),
                              foregroundColor: tWhiteColor,
                              backgroundColor: tPrimaryColor,
                              padding:
                                  EdgeInsets.symmetric(vertical: tButtonHeight),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Upcoming appointments ',
                            style: TextStyle(
                                fontFamily: 'PoppinsBold', fontSize: 18),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(() => AppointmentScreen());
                            },
                            child: Text(
                              'View all',
                              style: TextStyle(
                                  fontFamily: 'PoppinsBold',
                                  fontSize: 14,
                                  color: tAutismCard),
                            ),
                          )
                        ]),

                    SizedBox(
                      height: 15,
                    ),
                    FutureBuilder<QuerySnapshot>(
                      future: firestore
                          .collection('Appointments')
                          .where('email', isEqualTo: auth.currentUser!.email)
                          .orderBy('date', descending: true)
                          // .limit(3)
                          .get(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }

                        final List<DocumentSnapshot> documents =
                            snapshot.data!.docs;

                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            final appointment =
                                AppointmentModal.fromSnapshot(documents[index]);
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10, top: 10),
                              child: Card(
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(10),
                                  leading: Image.asset(tAppointmentImage),
                                  title: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        appointment.centrename,
                                        style: TextStyle(
                                          fontFamily: 'PoppinsBold',
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        appointment.contact,
                                        style: TextStyle(
                                          fontFamily: 'PoppinsMedium',
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        appointment.address,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: 'PoppinsMedium',
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        appointment.state,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontFamily: 'PoppinsMedium',
                                          fontSize: 12,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Category: ',
                                            style: TextStyle(
                                              fontFamily: 'PoppinsMedium',
                                              fontSize: 12,
                                            ),
                                          ),
                                          Flexible(
                                            child: RichText(
                                              overflow: TextOverflow.ellipsis,
                                              strutStyle:
                                                  StrutStyle(fontSize: 12.0),
                                              text: TextSpan(
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.italic,
                                                  fontFamily: 'PoppinsMedium',
                                                  fontSize: 12.0,
                                                ),
                                                text: appointment.category,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    // go to centre details screen
                                  },
                                  trailing: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        appointment.date,
                                        style: TextStyle(
                                          fontFamily: 'PoppinsMedium',
                                          fontSize: 12,
                                        ),
                                      ),
                                      Text(
                                        appointment.time,
                                        style: TextStyle(
                                          fontFamily: 'PoppinsMedium',
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  tileColor: tCardBgColor,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "That's all folks!",
                            style: TextStyle(
                              fontFamily: 'PoppinsBold',
                              fontStyle: FontStyle.italic,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
