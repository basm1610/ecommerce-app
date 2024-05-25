import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCardShippingAddress extends StatelessWidget {
  String title;
  String subTitle;
  bool isActive;
   CustomCardShippingAddress({super.key,required this.title,required this.subTitle,required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
       color:isActive? AppColor.customRed:null,
      child: ListTile(
          title: Text(
            title,
            style: TextStyle(color:isActive? Colors.white:null),
          ),
          subtitle: Text(
            subTitle,
            style: TextStyle(color:isActive? Colors.white:null),
          )),
    );
  }
}
