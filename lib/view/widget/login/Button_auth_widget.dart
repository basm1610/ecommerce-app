import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/core/localization/change_local.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonAuthWidget extends StatelessWidget {
  final String text;
  void Function()? onPressed;
  LocaleController localeController = LocaleController();
   ButtonAuthWidget({super.key, required this.text,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child:  MaterialButton(
        onPressed: onPressed,
        color: AppColor.primaryColor,
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 12),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        // ignore: unrelated_type_equality_checks
        child:  Text(text,style: const TextStyle(fontSize: 15),),
      ),
    );
  }
}
