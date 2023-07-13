import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:rehabcentre/src/features/models/appointment_model.dart';
import 'package:rehabcentre/src/features/models/user_model.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizes.dart';
import '../../models/centre_model.dart';
import '../profile/profile_screen.dart';

class BookAppointmentScreen extends StatefulWidget {
  final CentreModal centre;

  const BookAppointmentScreen({required this.centre});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showCupertinoModalPopup<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            ModalBarrier(
              color: Colors.black.withOpacity(0.5),
              dismissible: false,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime.now(),
                  minimumDate: DateTime.now().subtract(Duration(days: 1)),
                  maximumYear: 2100,
                  onDateTimeChanged: (DateTime newDate) {
                    setState(() {
                      selectedDate = newDate;
                    });
                  },
                ),
              ),
            ),
          ],
        );
      },
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showModalBottomSheet<TimeOfDay>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            initialDateTime: DateTime.now(),
            use24hFormat: true,
            onDateTimeChanged: (DateTime newDateTime) {
              setState(() {
                selectedTime = TimeOfDay.fromDateTime(newDateTime);
              });
            },
          ),
        );
      },
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

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
          "Book Appointment",
          style: TextStyle(
            fontFamily: 'PoppinsBold',
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${widget.centre.name}',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'PoppinsBold',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'Category : ',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'PoppinsMedium',
                        ),
                      ),
                      Text(
                        '${widget.centre.category}',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'PoppinsBold',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'State : ',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'PoppinsMedium',
                        ),
                      ),
                      Text(
                        '${widget.centre.state}',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'PoppinsBold',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Contact : ',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'PoppinsMedium',
                        ),
                      ),
                      Text(
                        '${widget.centre.contact}',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'PoppinsBold',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Address : ${widget.centre.address}',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'PoppinsMedium',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('Select Date'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFE400),
                      onPrimary: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  selectedDate != null
                      ? Text(
                          'Selected Date: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}',
                          style: TextStyle(fontSize: 18),
                        )
                      : Container(
                          child: Text('No date selected'),
                        ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => _selectTime(context),
                    child: Text('Select Time'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFFFE400),
                      onPrimary: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  selectedTime != null
                      ? Text(
                          'Selected Time: ${selectedTime!.format(context)}',
                          style: TextStyle(fontSize: 18),
                        )
                      : Container(
                          child: Text('No time selected'),
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // var details = await FirebaseAuth.instance.currentUser;
                      bookAppointment();
                     
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Future<void> bookAppointment() async {
     List DataList =
                          await AppointmentModal.getSnapshotViaEmail(
                              ProfileScreen.userData!.email.toString());

                      await UserModal.userFetch();
                      Map<String, dynamic> temp = {
                        "username": ProfileScreen.userData!.fullname,
                        "email": ProfileScreen.userData!.email,
                        "centername": widget.centre.name,
                        "category": widget.centre.category,
                        "state": widget.centre.state,
                        "contact": widget.centre.contact,
                        "address": widget.centre.address,
                        "date": DateFormat('yyyy-MM-dd').format(selectedDate!),
                        "time": selectedTime!.format(context),
                        // "time": DateTime.now().toIso8601String(),
                        "status": "pending"
                      };

                      DateTime selectedDateTime = DateTime.parse(
                          "${DateFormat('yyyy-MM-dd').format(selectedDate!)} ${selectedTime!.format(context)}:00");

                      // check if the user has already booked an appointment
                      for (var i in DataList) {
                        var date = i["date"];
                        var time = i["time"];

                        DateTime appointmentTime =
                            DateTime.parse("$date $time:00");
                        log(appointmentTime.toIso8601String());
                        var diff = appointmentTime
                            .difference(selectedDateTime)
                            .inHours;

                        log(diff.toString());
                        // log(diff.inHours.toString());
                        if ((diff >= 0 && diff < 1)) {
                          Get.snackbar(
                            'Appointment Error',
                            'You have already booked an appointment at this time',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red.shade400,
                            colorText: tWhiteColor,
                            margin: EdgeInsets.all(16),
                            borderRadius: 8,
                            duration: Duration(seconds: 3),
                          );
                          return;
                        }
                      }

                      await db.collection("Appointments").add(temp);
                      Get.snackbar(
                        'Appointment Done',
                        'Your appointment has been booked',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green.shade400,
                        colorText: Colors.white,
                        margin: EdgeInsets.all(16),
                        borderRadius: 8,
                        duration: Duration(seconds: 3),
                      );

  }
}
