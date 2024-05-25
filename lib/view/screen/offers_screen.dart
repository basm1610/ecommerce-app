import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/offers_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/view/widget/offers/list_product_items_offers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    OffersController controller = Get.put(OffersController());
    // ignore: unused_local_variable
    FavoriteController controllerFav = Get.put(FavoriteController());
    return GetBuilder<OffersController>(builder: (controller) =>
       HandlingDataRequest(
        statusRequest: controller.statusRequest,
        widget: ListView.builder(
            itemCount: controller.data.length,
            itemBuilder: (context, index) => CustomListItemsOffers(itemsModel: controller.data[index])))
    );
  }
}
