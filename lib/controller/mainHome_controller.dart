import 'package:ecommerce_app/view/screen/favorite_screen.dart';
import 'package:ecommerce_app/view/screen/home_screen.dart';
import 'package:ecommerce_app/view/screen/offers_screen.dart';
import 'package:ecommerce_app/view/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MainHomeController extends GetxController {
  onChangePage(int i);
}

class MainHomeControllerImp extends MainHomeController {
  int currentIndex = 0;

  List<Widget> listPage = [
    const HomeScreen(),
    const FavoriteScreen(),
    const OfferScreen(),
    const Settings(),
  ];
  List titleBottomBar = [
    "home",
    "Favorite",
    "offers",
    "setting",
  ];
  List<IconData> iconBottomBar = [
    Icons.home,
    Icons.favorite_rounded,
    Icons.local_offer,
    Icons.settings,
  ];

  @override
  onChangePage(int i) {
    currentIndex = i;
    update();
  }
}
