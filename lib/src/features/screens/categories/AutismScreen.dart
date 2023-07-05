import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:rehabcentre/src/constants/colors.dart';
import 'package:rehabcentre/src/constants/image_strings.dart';

import '../../models/centre_model.dart';
import 'CentreDetailsScreen.dart';

class AutismScreen extends StatefulWidget {
  const AutismScreen({super.key});

  @override
  State<AutismScreen> createState() => _AutismScreenState();
}

class _AutismScreenState extends State<AutismScreen> {
  final TextEditingController _searchController = TextEditingController();
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
          "Autism Disability",
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
              .collection('RehabCentre')
              .where('category', isEqualTo: 'Autism')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                final centre = CentreModal.fromSnapshot(documents[index]);
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Card(
                    child: ListTile(
                      contentPadding: EdgeInsets.all(10),
                      leading: Image.asset(tAustismImage),
                      title: Expanded(
                        child: Text(
                          centre.name,
                          style: TextStyle(
                            fontFamily: 'PoppinsBold',
                            fontSize: 14,
                          ),
                        ),
                      ),
                      subtitle: Expanded(
                          child: Text(
                        centre.contact,
                        style: TextStyle(
                          fontFamily: 'PoppinsMedium',
                          fontSize: 12,

                        
                        ),
                      )),
                      onTap: () {
                        // go to centre details screen
                        Get.to(() => CentreDetailsScreen(centre: centre));
                      },
                      trailing: Text(
                        centre.state,
                        style: TextStyle(
                          fontFamily: 'PoppinsMedium',
                          fontSize: 12,
                        ),
                      ),
                      tileColor: tCardBgColor,
                      // Add more fields as required
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
