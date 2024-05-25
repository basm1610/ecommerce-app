import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/constant/colors.dart';

class DotsWidget extends StatelessWidget {
  const DotsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<OnBoardingControllerImp>(builder: ((controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
            onBoardingList.length,
                (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 12),
              duration: const Duration(milliseconds: 900),
              width: controller.currentPage==index?20:6,
              height: 6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColor.primaryColor),
            ),
          ),
        ],
      );
    }));
  }
}
