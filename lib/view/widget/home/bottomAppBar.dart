import 'package:ecommerce_app/controller/mainHome_controller.dart';
import 'package:ecommerce_app/view/widget/home/button_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainHomeControllerImp>(
        builder: ((controller) => BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 5,
              child: Row(
                children: [
                  ...List.generate(controller.listPage.length + 1, (index) {
                    int i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? const Spacer()
                        : ButtonAppBarWidget(
                            onPressed: () {
                              controller.onChangePage(i);
                            },
                            text: controller.titleBottomBar[i],
                            icon: controller.iconBottomBar[i],
                            active:
                                controller.currentIndex == i ? true : false);
                  })
                ],
              ),
            )));
  }
}
