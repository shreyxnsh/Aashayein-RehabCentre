import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
    
    final String image, title, subtitle;
    

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Image(image: AssetImage(image), height: size.height *0.2,)),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontFamily: 'PoppinsBold', fontSize: 22, ),),
            Text(subtitle, style: TextStyle(fontFamily: 'PoppinsMedium', fontSize: 16, ),),
            ],
          ),
          
        ),
        
        
      ],
    );
  }
}