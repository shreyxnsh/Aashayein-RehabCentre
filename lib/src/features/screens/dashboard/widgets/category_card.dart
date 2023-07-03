import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../categories/AutismScreen.dart';
import '../../categories/LearningScreen.dart';
import '../../categories/SpeechScreen.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                color: tAutismCard,
              ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(tAustismImage,height: 30,width: 30, color: Colors.white,),
                  Text(
                    "Autism",
                    style: TextStyle(
                        fontFamily: 'PoppinsMedium',
                        color: Colors.white,
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
                color: tSpeechCard,
              ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [

                  Image.asset(tSpeechImage,height: 30,width: 30, color: Colors.white,),
                  Text(
                    "Speech",
                    style: TextStyle(
                        fontFamily: 'PoppinsMedium',
                        color: Colors.white,
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
                color: tLearningCard,
              ),
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [

                  Image.asset(tLearningImage,height: 30,width: 30,color: Colors.white,),
                  Text(
                    "Learning Disability",
                    style: TextStyle(
                        fontFamily: 'PoppinsMedium',
                        color: Colors.white,
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
    );
  }
}