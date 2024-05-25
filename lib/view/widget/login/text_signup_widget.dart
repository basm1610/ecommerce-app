import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';

class TextSignUpWidget extends StatelessWidget {
  final String textOne;
  final String textTwo;
  final void Function() onTap ;
  const TextSignUpWidget({Key? key,required this.textOne,required this.textTwo,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:  [
         Text(textOne),
        InkWell(
          onTap: onTap ,
          child:  Text(
            textTwo,
            style: const TextStyle(
                color: AppColor.primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
