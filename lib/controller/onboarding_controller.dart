import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:ecommerce_app/core/services/my_services.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();

  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  @override
  next() {
    currentPage++;
    if (currentPage > onBoardingList.length-1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRouts.login);
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }


  late PageController pageController;
  int currentPage = 0;
  MyServices myServices = Get.find();


  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
