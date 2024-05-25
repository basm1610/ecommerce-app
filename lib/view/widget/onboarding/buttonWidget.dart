import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class ButtonWidget extends GetView<OnBoardingControllerImp> {
  final String text;
  final double horizontal;
  final double fontSized ;
  final void Function()? onPressed;
  const ButtonWidget( {Key? key,required this.text,required this.horizontal,required this.fontSized,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColor.primaryColor,
      height: 30,
      padding:  EdgeInsets.symmetric(horizontal: horizontal,vertical: 12),
      textColor: Colors.white,
      child:  Text(text,style:  TextStyle(fontSize: fontSized),),
    );
  }
}
