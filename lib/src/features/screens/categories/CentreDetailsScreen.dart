import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:rehabcentre/src/constants/image_strings.dart';
import 'package:rehabcentre/src/features/screens/appointments/book_appointment_screen.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../models/centre_model.dart';

class CentreDetailsScreen extends StatelessWidget {
  final CentreModal centre;

  const CentreDetailsScreen({required this.centre});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "${centre.name}",
          style: TextStyle(
            fontFamily: 'PoppinsBold',
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 18.0),
          child: SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () {
                // go to the next screen
                Get.to(() => BookAppointmentScreen(centre: centre));
              },
              child: Text(
                'Book Appointment',
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
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${centre.name}',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'PoppinsBold',
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Category : ${centre.category}',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'PoppinsMedium',
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'State : ${centre.state}',
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'PoppinsMedium',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Image(image: AssetImage(tRBIImage)),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: tPrimaryColor,
                                ),
                                child: Icon(
                                  Icons.verified,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Text(
                  //   'Contact: ${centre.contact}',
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  // Text(
                  //   'Address: ${centre.address}',
                  //   style: TextStyle(
                  //     fontSize: 14,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),

                  Text(
                    '${centre.about}',
                    style: TextStyle(fontSize: 13, fontFamily: 'PoppinsMedium'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Icon(
                        LineAwesomeIcons.phone,
                        size: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${centre.contact}',
                        style: TextStyle(
                            fontSize: 15, fontFamily: 'PoppinsMedium'),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: Icon(
                                LineAwesomeIcons.address_book_1,
                                size: 30,
                              )),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          '${centre.address}',
                          style: TextStyle(
                              fontSize: 13, fontFamily: 'PoppinsMedium'),
                        ),
                      ),
                    ],
                  ),

                  // Add more details as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
