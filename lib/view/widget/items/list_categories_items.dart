import 'package:ecommerce_app/controller/items_controller.dart';
import 'package:ecommerce_app/core/functions/translate_datebase.dart';
import 'package:ecommerce_app/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 110,
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            width: 10,
          ),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Categories(
              i: index,
              categoriesModel:
              CategoriesModel.fromJson(controller.categories[index]),

            );
          }),
    );
  }
}

// ignore: must_be_immutable
class Categories extends StatelessWidget {
  CategoriesModel categoriesModel;
  final int? i;

  Categories({super.key, required this.categoriesModel,required this.i });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(builder: ((controller) =>
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: (){
            // controller.goToItems(controller.categories,i! );
            controller.changeCat(i!,categoriesModel.categoriesId!);
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration:controller.selectCat == i? BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red[600]
            ):BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: Colors.black45),
            child: Text(
              "${DatabaseTranslation(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),

      ],
    )));
  }
}
