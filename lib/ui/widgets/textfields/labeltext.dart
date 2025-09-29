import 'package:flutter/material.dart';

import '/core/constant/color.dart';
import '/core/constant/fonts.dart';
class LabelText extends StatelessWidget {
  final String text;
  final String star;
  const LabelText({super.key, required this.text,  this.star=''});

  @override
  Widget build(BuildContext context) {
    return Align(alignment:Alignment.centerLeft,child: Row(
      children: [
        Text(text!,style: s.copyWith(color:blackshade.withOpacity(0.9),fontWeight: FontWeight.bold),),
        SizedBox(width: 5,),
        Text(star!,style: s.copyWith(color:red,fontWeight: FontWeight.bold),),
      ],
    ));
  }
}
