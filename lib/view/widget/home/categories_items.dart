import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/core/functions/translate_datebase.dart';
import 'package:ecommerce_app/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/link_api.dart';

class CategoriesItem extends GetView<HomeControllerImp> {
  const CategoriesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        height: 115,
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, childAspectRatio: 1.1),
            itemCount: controller.categories.length,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Categories(
                i: index,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]),
              );
            })
        );
  }
}

// ignore: must_be_immutable
class Categories extends GetView<HomeControllerImp> {
  CategoriesModel categoriesModel;
  final int? i;

  Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            controller.goToItems(
                controller.categories, i!, categoriesModel.categoriesId!);
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black12, borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 70,
            width: 70,
            child: SvgPicture.network(
              "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
              // ignore: deprecated_member_use
              color: AppColor.primaryColor,
              width: 50,
              height: 50,
            ),
          ),
        ),
        Text(
          "${DatabaseTranslation(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
          style: const TextStyle(fontSize: 13, color: Colors.black),
        ),
      ],
    );
  }
}
