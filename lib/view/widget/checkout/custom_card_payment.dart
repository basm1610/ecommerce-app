import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCardPayment extends StatelessWidget {
  String title;
  bool isActive;
   CustomCardPayment({super.key,required this.title,required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(
          horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
          color:isActive? AppColor.customRed:Colors.red[100],
          borderRadius: BorderRadius.circular(15)),
      child:  Text(
        title,
        style: TextStyle(color:isActive? Colors.white:Colors.red, fontSize: 20),
      ),
    );
  }
}
