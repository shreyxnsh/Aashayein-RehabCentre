import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../models/appointment_model.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    var details = FirebaseAuth.instance.currentUser;
    

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
          "Appointment History",
          style: TextStyle(
            fontFamily: 'PoppinsBold',
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Appointments')
              .where('email', isEqualTo: details!.email)
              .orderBy('date', descending: true)
              .orderBy('__name__', descending: true)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            // Data snapshot has been received
            final List<DocumentSnapshot> documents = snapshot.data!.docs;

            // Iterate over the documents and create a ListView
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (BuildContext context, int index) {
                final appointment = AppointmentModal.fromSnapshot(documents[index]);
                
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Card(
                    
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10),
                      leading: Image.asset(tAppointmentImage, color: Colors.black,),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appointment.centrename,
                            style: TextStyle(
                              fontFamily: 'PoppinsBold',
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            appointment.contact,
                            style: TextStyle(
                              fontFamily: 'PoppinsMedium',
                              color: Colors.black,
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
                              color: Colors.black,
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
                              color: Colors.black,
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
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                              Flexible(
                                child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  strutStyle: StrutStyle(fontSize: 12.0),
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
                          // Add more Text widgets for additional texts
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
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            appointment.time,
                            style: TextStyle(
                              fontFamily: 'PoppinsMedium',
                              color: Colors.black,
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
      ),
    );
  }
}
