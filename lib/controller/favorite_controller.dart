import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data.dart';
import 'package:ecommerce_app/core/services/my_services.dart';
import 'package:ecommerce_app/data/datasource/remote/favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  Map isFavorite = {};
  FavoriteData favoriteData = FavoriteData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  List data = [];

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String itemsId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString("id")!, itemsId);
    print("************items*******************");
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.rawSnackbar(
          title: "اشعار", messageText: const Text("تم الاضافه الي المفضله"), duration: Duration(milliseconds: 500),);
    } else {
      statusRequest = StatusRequest.failure;
      print("no data");
    }
  }

  deleteFavorite(String itemsId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.deleteFavorite(
        myServices.sharedPreferences.getString("id")!, itemsId);
    print("************items*******************");
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          duration: Duration(milliseconds: 500),
          title: "اشعار",
          messageText: const Text("تم الحذف من المفضله"),
        );
      } else {
        statusRequest = StatusRequest.failure;
        print("no data");
      }
    }
  }
}
