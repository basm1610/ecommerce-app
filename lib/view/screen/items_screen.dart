import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/view/widget/items/list_categories_items.dart';
import 'package:ecommerce_app/view/widget/items/list_product_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ItemsScreen extends StatelessWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
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
      body: GetBuilder<ItemsControllerImp>(
          builder: ((controller) => ListView(
            children: [
              const ListCategoriesItems(),
              HandlingDataView(statusRequest: controller.statusRequest,widget: const ListProductItems(),),
            ],
          )
          )
      ),
    );
  }
}
