import 'dart:convert';
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
import 'package:rehabcentre/src/features/screens/profile/profile_screen.dart';
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

                          return Column(children: [
                            Text(
                              "Hello, ",
                              style: TextStyle(
                                  fontFamily: 'PoppinsMedium', fontSize: 20),
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
                        'Disabilities',
                        style:
                            TextStyle(fontFamily: 'PoppinsBold', fontSize: 18),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 45,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      
                    ],
                  ),
                ),

                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
