import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/fonts.dart';
class Appbarprofile extends StatelessWidget {
  final double height;
  const Appbarprofile({super.key, required this.height});

  @override
  Widget build(BuildContext context) {

    return  Container(
      height:height*0.3,
      color: primary,
      child: Column(
        children: [
          Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back,color: white,)),
                  SizedBox(width: 5,),
                  Text('My Profile',style: b.copyWith(color: white,fontSize: 18,fontWeight: FontWeight.bold),)
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: white,
                      shape: BoxShape.circle,

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child:   Icon(LineIcons.edit)
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    decoration: BoxDecoration(
                      color: white,
                      shape: BoxShape.circle,

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(LineIcons.bell),
                    ),
                  ),
                  SizedBox(width: 10,),
                ],
              )

            ],
          ),
        ],
      ),
    );
  }
}
