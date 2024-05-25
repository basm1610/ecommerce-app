import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/datasource/static/static.dart';

class SliderWidget extends GetView<OnBoardingControllerImp> {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value){
        controller.onPageChanged(value);
      },
        itemCount: onBoardingList.length,
        itemBuilder: (context, index) => 
        Column(
          children: [
            Text(
              onBoardingList[index].title!,
              style: const TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold,color: Colors.black) ,
            ),
            const SizedBox(
              height: 80,
            ),
            Image.asset(
              onBoardingList[index].image!,
              // width: 200,
              height: Get.width/1.44,
              // fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 55,
            ),
            Text(
              onBoardingList[index].description!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 2,
                color: AppColor.textColor,
                fontSize: 15,
              ),
            ),
          ],
        ));
  }
}
