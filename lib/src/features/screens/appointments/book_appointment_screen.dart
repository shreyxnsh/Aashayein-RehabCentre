import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../models/centre_model.dart';

class BookAppointmentScreen extends StatefulWidget {
  const BookAppointmentScreen({super.key});

  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
    );
  }
}

// class BookAppointmentScreen extends StatefulWidget {
//   final CentreModal centre;

//   const BookAppointmentScreen({required this.centre});

//   @override
//   // ignore: library_private_types_in_public_api
//   _BookAppointmentScreenState createState() => _BookAppointmentScreenState();
// }

// class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
//   DateTime? selectedDate;
//   TimeOfDay? selectedTime;

//   Future<void> bookAppointment() async {
//     if (selectedDate == null || selectedTime == null) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Incomplete Selection'),
//             content: Text('Please select both date and time.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//       return;
//     }

//     try {
//       // Format date and time
//       String formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);
//       String formattedTime = selectedTime!.format(context);

//       // Store appointment data in Firestore
//       await FirebaseFirestore.instance.collection('Appointments').add({
//         'rehabCenter': widget.centre.name,
//         'date': formattedDate,
//         'time': formattedTime,
//       });

//       // Show success message or perform any additional actions
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Appointment Booked'),
//             content: Text('Your appointment has been successfully booked.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     } catch (e) {
//       // Show error message or handle the error
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Error'),
//             content: Text('An error occurred. Please try again.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text('OK'),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Book Appointment'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             ListTile(
//               title: Text('Select Date'),
//               subtitle: selectedDate != null
//                   ? Text(DateFormat('yyyy-MM-dd').format(selectedDate!))
//                   : Text('No date selected'),
//               trailing: Icon(Icons.calendar_today),
//               onTap: () async {
//                 final DateTime? pickedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime.now(),
//                   lastDate: DateTime.now().add(Duration(days: 365)),
//                 );

//                 if (pickedDate != null) {
//                   setState(() {
//                     selectedDate = pickedDate;
//                   });
//                 }
//               },
//             ),
//             SizedBox(height: 20),
//             ListTile(
//               title: Text('Select Time'),
//               subtitle: selectedTime != null
//                   ? Text(selectedTime!.format(context))
//                   : Text('No time selected'),
//               trailing: Icon(Icons.access_time),
//               onTap: () async {
//                 final TimeOfDay? pickedTime = await showTimePicker(
//                   context: context,
//                   initialTime: TimeOfDay.now(),
//                 );

//                 if (pickedTime != null) {
//                   setState(() {
//                     selectedTime = pickedTime;
//                   });
//                 }
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 bookAppointment();
//               },
//               child: Text('Book Appointment'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
