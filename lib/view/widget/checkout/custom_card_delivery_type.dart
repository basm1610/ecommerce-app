import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCardDeliveryType extends StatelessWidget {
  String imageName;
  String title;
  bool isActive;
   CustomCardDeliveryType({super.key,required this.imageName,required this.title,required this.isActive});

  @override
  Widget build(BuildContext context) {
    return   Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 30, vertical: 10),
      decoration:  BoxDecoration(
        color:isActive? AppColor.customRed:Colors.white,
          border:isActive?null: Border.all(
            color: Colors.redAccent,
          )
      ),
      child: Column(
        children: [
          Image.asset(
            imageName,
            width: 75,
            color:isActive? Colors.white:null,
          ),
           Text(
           title,
            style:
            TextStyle(color:isActive? Colors.white:Colors.redAccent, fontSize: 18),
          )
        ],
      ),
    );
  }
}
