import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/constant/link_api.dart';
import 'package:ecommerce_app/core/functions/translate_datebase.dart';
import 'package:ecommerce_app/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductItems extends GetView<HomeControllerImp> {
  const ProductItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: controller.items.length,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1.05),
          itemBuilder: (context, index) {
            return ItemsHome(
                onTapCard: (){},
                itemsModel: ItemsModel.fromJson(controller.items[index]));
          }),
    );
  }
}

// ignore: must_be_immutable
class ItemsHome extends GetView<HomeControllerImp> {
  ItemsModel itemsModel;
  void Function()? onTapCard;

  ItemsHome({super.key, required this.itemsModel,required this.onTapCard});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToProductDetails(itemsModel);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: "${AppLink.imageItems}/${itemsModel.itemsImage}",
                    width: double.maxFinite,
                    height: 100,
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text("${DatabaseTranslation(itemsModel.itemsNameAr,itemsModel.itemsName)}",
                          style: const TextStyle(fontSize: 16),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 15,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${itemsModel.itemsPrice} \$",
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontSize: 16,
                            fontFamily: "sans"
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
