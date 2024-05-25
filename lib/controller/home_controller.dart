import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routs_name.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/core/services/my_services.dart';
import 'package:ecommerce_app/data/datasource/remote/home.dart';
import 'package:ecommerce_app/data/model/items_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  intialData();

  getData();

  goToItems(List categories, int selectCat,String categoryId);
  goToProductDetails(ItemsModel itemsModel);
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  String? email;
  late StatusRequest statusRequest;
  String? lang;

  HomeData homeData = HomeData(Get.find());
  List categories = [];
  List items = [];
  List<ItemsModel> listData =[];

  @override
  void onInit() {
    search = TextEditingController();
    // FirebaseMessaging.instance.subscribeToTopic("users");
    intialData();
    getData();
    super.onInit();
  }

  intialData() {
    lang = myServices.sharedPreferences.getString("lang");
    email = myServices.sharedPreferences.getString("email");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']["data"]);
        items.addAll(response['items']["data"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }


  searchItems() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listData.clear();
       List responseData = response["data"];
       listData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
  
  @override
  goToItems(categories, selectCat,categoryId) {
    Get.toNamed(AppRouts.items,
        arguments: {"categories": categories, "selectCat": selectCat,"categoryId":categoryId});
  }
  @override
  goToProductDetails(itemsModel) {
    Get.toNamed(AppRouts.productDetails,arguments: {
      "itemsModel":itemsModel,
    });
  }

  bool isSearch = false;
  TextEditingController? search;
  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchItems();
    update();
  }



}
