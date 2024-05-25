import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/link_api.dart';
import 'package:ecommerce_app/view/widget/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/model/items_model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      // appBar: AppBar(
      //   titleSpacing: 1,
      //   centerTitle: true,
      //   backgroundColor: AppColor.primaryColor,
      //   title: Text(
      //     "59".tr,
      //     style: const TextStyle(fontWeight: FontWeight.bold),
      //   ),
      //   actions: [
      //     IconButton(onPressed: () {}, icon: const Icon(Icons.search_sharp)),
      //     IconButton(
      //         onPressed: () {
      //           Get.toNamed(AppRouts.myFavorite);
      //         },
      //         icon: const Icon(Icons.favorite_outline_sharp)),
      //   ],
      // ),
      body: SafeArea(
        child: GetBuilder<HomeControllerImp>(
          builder: (controller) => ListView(
            children: [
              CustomAppBar(
                titleappbar: 'Find Product',
                onPressedIconFavorite: () {},
                mycontroller: controller.search!,
                onChanged: (val) {
                  controller.checkSearch(val);
                },
                onPressedSearch: () {
                  controller.onSearchItems();
                },
                onFieldSubmitted: (val) {
                  controller.onSearchItems();
                },
              ),
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.isSearch
                      ? ListItemsSearch(
                          listItemModel: controller.listData)
                      : Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List<ItemsModel> listItemModel;

  const ListItemsSearch({Key? key, required this.listItemModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listItemModel.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.goToProductDetails(listItemModel[index]);
            },
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imageItems}/${listItemModel[index].itemsImage}",
                        height: 80,
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text("${listItemModel[index].itemsName}"),
                          subtitle:
                              Text("${listItemModel[index].categoriesName}"),
                        ))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
