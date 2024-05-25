import 'package:ecommerce_app/controller/myfavorite_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/view/widget/myfavorite/custom_list_favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        titleSpacing: 1,
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          "Our Product",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteController>(builder: (controller)=>
            HandlingDataView(
              statusRequest: controller.statusRequest,
               widget:GridView.builder(
                      shrinkWrap: true,
                      itemCount: controller.data.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: .6),
                      itemBuilder: (context, index) {

                        return CustomListFavoriteItems(itemsModel: controller.data[index],);
                      }),

        ),
      ),
      ),
    );
  }
}
