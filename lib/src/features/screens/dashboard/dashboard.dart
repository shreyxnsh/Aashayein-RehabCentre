import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rehabcentre/src/constants/colors.dart';
import 'package:rehabcentre/src/features/screens/profile/profile_screen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.menu, color: Colors.black,),
          title: Text('Aashayein', style: TextStyle(
            fontFamily: 'PoppinsBold',
            fontSize: 18,
            color: Colors.black,
    

          ),),
          centerTitle: true ,
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
                onPressed: (){
                  Get.to(() => ProfileScreen());
                },
                icon: Icon(Icons.person, color: Colors.black,)),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),

            child: Row(
              children: [
                
              ]
            ),

          ),
        ),
        
      ),
    );
  }
}