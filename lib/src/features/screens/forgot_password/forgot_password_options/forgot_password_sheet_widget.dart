
import 'package:flutter/material.dart';

class ForgotpasswordBtnWidget extends StatelessWidget {
  const ForgotpasswordBtnWidget({
    required this.btnIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final IconData btnIcon;
  final String title, subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Icon(btnIcon, size: 50.0,),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontFamily: 'PoppinsBold', fontSize: 14),
                ),
                Text(subtitle, 
                style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: 12)
                )
              ],
            )
          ]),
      ),
    );
  }
}