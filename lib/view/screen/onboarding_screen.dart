import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/view/widget/onboarding/buttonWidget.dart';
import 'package:ecommerce_app/view/widget/onboarding/dotsWidget.dart';
import 'package:ecommerce_app/view/widget/onboarding/sliderWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backgroundcolor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
               Expanded(
                flex: 3,
                child: SliderWidget(),
              ),
              Expanded(
                child: Column(
                  children: [
                    const DotsWidget(),
                    const SizedBox(
                      height: 50,
                    ),
                    GetBuilder<OnBoardingControllerImp>(
                      builder: ((controller) => ButtonWidget(
                            text: controller.currentPage == 2
                                ? "8".tr
                                : "57".tr,
                            fontSized: controller.currentPage == 2 ? 20 : 20,
                        horizontal: controller.currentPage==2?60:81, onPressed: () {controller.next();  },
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
