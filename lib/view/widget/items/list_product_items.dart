import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/core/constant/link_api.dart';
import 'package:ecommerce_app/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/functions/translate_datebase.dart';

class ListProductItems extends StatelessWidget {
  const ListProductItems({super.key});

  @override
  Widget build(BuildContext context) {
   ItemsControllerImp controller = Get.put(ItemsControllerImp());
   FavoriteController controllerFav = Get.put(FavoriteController());

    return GridView.builder(
        shrinkWrap: true,
        itemCount: controller.data.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate:
         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio:controller.lang == "ar"? .64 :.68),
        itemBuilder: (context, index) {
          controllerFav.isFavorite[controller.data[index]["items_id"]] = controller.data[index]["favorite"];
          return ItemsHome(

              itemsModel: ItemsModel.fromJson(controller.data[index]));
        });
  }
}

// ignore: must_be_immutable
class ItemsHome extends GetView<ItemsControllerImp> {
  ItemsModel itemsModel;


  ItemsHome({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        controller.goToProductDetails(itemsModel);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: "${itemsModel.itemsId}",
                    child: CachedNetworkImage(
                      imageUrl: "${AppLink.imageItems}/${itemsModel.itemsImage}",
                      width: double.maxFinite,
                      height: 130,
                      // fit: BoxFit.fill,
                    ),
                  ),
                  // SizedBox(height: 5,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text("${DatabaseTranslation(itemsModel.itemsNameAr,itemsModel.itemsName)}",
                            style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis),
                      ),
                      const SizedBox(height: 5,),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text("${DatabaseTranslation(itemsModel.itemsDescAr,itemsModel.itemsDesc)}",
                            style: const TextStyle(fontSize: 14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                      ),
                      const SizedBox(height: 5,),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            itemsModel.itemsDiscount != "0" ? Column(
                              children: [
                                Text(
                                  "${itemsModel.itemsPrice} \$",
                                  style:  const TextStyle(
                                    decoration:  TextDecoration.lineThrough ,
                                      color:  Colors.black38,
                                      fontSize:  12 ,
                                      fontFamily: "sans"

                                  ),
                                ),
                              Text(
                                  "${itemsModel.itemsPriceDiscount} \$",
                                  style: const TextStyle(
                                      color: Colors.redAccent,
                                      fontSize: 16,
                                      fontFamily: "sans"
                                  ),
                                )
                              ],
                            ):
                            Text(
                              "${itemsModel.itemsPrice} \$",
                              style:  const TextStyle(
                                  decoration:  TextDecoration.none ,
                                  color:  Colors.red,
                                  fontSize:  16 ,
                                  fontFamily: "sans"

                              ),
                            ),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: Center(
                                  child: GetBuilder<FavoriteController>(builder: (controller){
                                    return IconButton(
                                      onPressed: (){
                                        if(controller.isFavorite[itemsModel.itemsId] == "1"){
                                            controller.setFavorite(itemsModel.itemsId, "0");
                                            controller.deleteFavorite(itemsModel.itemsId!);
                                        }else{
                                          controller.setFavorite(itemsModel.itemsId, "1");
                                          controller.addFavorite(itemsModel.itemsId!);
                                        }
                                      },
                                      icon: Icon(
                                        controller.isFavorite[itemsModel.itemsId] == "1"
                                            ?Icons.favorite: Icons.favorite_border,
                                      ),color: AppColor.secondColor,
                                    );
                                  }
                                  )
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            if(itemsModel.itemsDiscount != "0")
            Positioned(
                right: 0,
                child: Container(
                  height: 25,
                  width: 50,
                  decoration: BoxDecoration(color: Colors.red.shade600),
                  // ignore: unnecessary_string_escapes
                  child: Center(child: Text("${itemsModel.itemsDiscount}\%",textAlign: TextAlign.center,style: const TextStyle(color: Colors.white,fontSize: 16),)),
                )),
          ],
        ),
      ),
    );
  }
}
