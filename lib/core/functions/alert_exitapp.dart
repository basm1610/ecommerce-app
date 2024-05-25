import 'dart:io';

import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {

  Get.defaultDialog(title: "تنبيه",
      middleText: "هل تريد الخروج من التطبيق",
      actions: [
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColor.primaryColor,
      ) ,
      onPressed: () {
        exit(0);
      },
      child: Text("confirm"),
    ),
    SizedBox(width: 5,),
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColor.primaryColor,
      ) ,
      onPressed: () {
        Get.back();
      },
      child: Text("cancel"),
    ),
  ]);
  return Future.value(true);
}
