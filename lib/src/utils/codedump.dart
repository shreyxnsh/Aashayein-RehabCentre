// ElevatedButton(
                //     onPressed: () async {
                //       FirebaseFirestore db = await FirebaseFirestore.instance;

                //       var uid = await FirebaseAuth.instance.currentUser!.uid;
                //       var details = await FirebaseAuth.instance.currentUser;

                //       // log(uid.toString());
                //       // log(details!.displayName.toString());
                //       // log(details!.email.toString());

                //       // log(ProfileScreen.userData!.email);
                //       // log(ProfileScreen.userData!.phoneNo);
                //       // log(ProfileScreen.userData!.fullname);
                //       // // db.collection("Users").doc(uid.toString());

                //       // await db
                //       //     .collection("Users")
                //       //     .doc("dN7aXf7kC4GPSDgsEsZ6")
                //       //     .set({
                //       //   "Name": "Aviral Yadav",
                //       //   "Phone": "8077963037",
                //       //   "App": [
                //       //     {"hello": "hi"},
                //       //     {"ping": "pong", "asf": 1},
                //       //     false,
                //       //     "hi"
                //       //   ],
                //       // });

                //       await db
                //           .collection("Appointments")
                //           .doc(details!.email.toString())
                //           .set({
                //         "Name": "Aviral Yadav",
                //         "Phone": "8077963037",
                //         "App": [
                //           {"hello": "hi"},
                //           {"ping": "pong", "asf": 1},
                //           false,
                //           "hi"

                //         ],
                //       });
                //       //


                //       // // add data in firestore
                //       // int varr = 1;
                //       // for (var i in rehabData) {
                //       //   await db.collection("RehabCentre").add(i);
                //       //   log((varr++).toString());
                //       // }
                //       // log("done dana done !!");

                //       // fetch data
                //       QuerySnapshot query = await db
                //           .collection("RehabCentre")
                //           .where("NAME OF CENTRE", isEqualTo: "Arise Impact")
                //           .get();
                //       var dattaaa = query.docs.single;
                //       log(dattaaa.data().toString());
                //       // for (var i in dattaaa) {
                //       //   Map<String, dynamic> val = jsonDecode(i.da);
                //       // }
                //       // Get.to(() => ProfileScreen());
                //     },
                //     child: Text("Book")),


                  // return ListView.builder(
                          //     shrinkWrap: true,
                          //     // scrollDirection: Axis.horizontal,
                          //     itemCount: snapshot.data!.length,
                          //     itemBuilder: (c, index) {
                          //       return Column(
                          //         children: [
                                    
                          //           ListTile(
                          //             iconColor: Colors.blue,
                          //             tileColor: Colors.blue.withOpacity(0.1),
                          //             leading: Icon(LineAwesomeIcons.user),
                          //             title: Text(
                          //                 "Name : ${snapshot.data![index].fullname}"),
                          //             subtitle: Column(
                          //               crossAxisAlignment:
                          //                   CrossAxisAlignment.start,
                          //               children: [
                          //                 Text(snapshot.data![index].phoneNo),
                          //                 Text(snapshot.data![index].email),
                          //               ],
                          //             ),
                          //           )
                          //         ],
                          //       );
                          //     }
                          //     );