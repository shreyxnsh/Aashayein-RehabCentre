import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../features/models/centre_model.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Centers with Category Autism'),
      ),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('RehabCentre')
              .where('category', isEqualTo: 'Austism')
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
                final centre = CentreModal.fromSnapshot(documents[index]);
                return Card(
                  child: ListTile(
                    title: Text(centre.name),
                    subtitle: Text(centre.address),
                    //dnmfieus
                    // Add more fields as required
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