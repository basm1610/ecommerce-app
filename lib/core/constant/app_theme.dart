import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/constant/colors.dart';

ThemeData themeEnglish = ThemeData(
    fontFamily: "PlayfairDisplay",
    appBarTheme: const AppBarTheme(backgroundColor: AppColor.primaryColor),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        height: 2,
        color: AppColor.textColor,
        fontSize: 15,
      ),
      headline1: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ));
ThemeData themeArabic = ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: AppColor.primaryColor),
    fontFamily: "Cairo",
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        height: 2,
        color: AppColor.textColor,
        fontSize: 15,
      ),
      headline1: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ));
